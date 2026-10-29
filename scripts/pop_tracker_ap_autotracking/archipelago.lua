AUTOTRACKER_ENABLE_ITEM_TRACKING     = true
AUTOTRACKER_ENABLE_LOCATION_TRACKING = true
AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP  = false

ScriptHost:LoadScript("scripts/pop_tracker_ap_autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/pop_tracker_ap_autotracking/location_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS  = {}
GLOBAL_ITEMS = {}

function onClear(slot_data)
    SLOT_DATA = slot_data
    CUR_INDEX = -1
    for _, v in pairs(LOCATION_MAPPING) do
        -- skip "=code:N" entries, they are handled separately below
        if v[1] and v[1]:sub(1,1) ~= "=" then
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[1]:sub(1,1) == "@" then obj.AvailableChestCount = obj.ChestCount
                else obj.Active = false end
            end
        end
    end
    for _, v in pairs(ITEM_MAPPING) do
        if v[1] and v[2] then
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if     v[2] == "toggle"      then obj.Active = false
                elseif v[2] == "progressive" then obj.CurrentStage = 0; obj.Active = false
                elseif v[2] == "consumable"  then obj.AcquiredCount = 0 end
            end
        end
    end
    -- Reset cycle progressives (allow_disabled=true, so set Active=false too)
    for _, code in ipairs(CYCLE_ITEM_CODES) do
        local obj = Tracker:FindObjectForCode(code)
        if obj then obj.Active = false; obj.CurrentStage = 0 end
    end
    -- Reset year tracker to Year 1 (allow_disabled=false, so only reset stage)
    for _, code in ipairs(YEAR_ITEM_CODES) do
        local obj = Tracker:FindObjectForCode(code)
        if obj then obj.CurrentStage = 0 end
    end
    -- Stage keys only gate the dungeons when the seed has them
    local keys = Tracker:FindObjectForCode("stage_keys_on")
    if keys then
        local on = slot_data and slot_data["stage_keys"]
        keys.Active = on == true or (type(on) == "number" and on ~= 0)
    end
    -- which dungeon each world-map spot leads to (Shuffle Loading Zones)
    SetWorldZones(slot_data and slot_data["world_zones"])
    local timed = slot_data and slot_data["rebena_te_ra_timed_chests"]
    TIMED_CHESTS_ON = timed == true or (type(timed) == "number" and timed ~= 0)
    local cycles = slot_data and tonumber(slot_data["progression_cycles"])
    PROGRESSION_CYCLES = cycles and math.floor(cycles) or 3
    -- with Monster Hunt Checks the chests are gone (enemies are the checks).
    -- 2 = Every Enemy, whose enemies have pins of their own
    local hunt = slot_data and slot_data["monster_hunt_checks"]
    hunt = hunt == true and 1 or tonumber(hunt) or 0
    CHESTS_SHOWN = hunt == 0
    ENEMIES_SHOWN = hunt ~= 0
    -- Shop Checks: the shops' slots are checks, pinned on the town maps
    local shops = slot_data and slot_data["shop_checks"]
    SHOPS_SHOWN = shops == true or (type(shops) == "number" and shops ~= 0)
    local bosses = slot_data and slot_data["monster_hunt_bosses"]
    HUNT_BOSSES = bosses == nil or bosses == true or (type(bosses) == "number" and bosses ~= 0)
    -- Progressive Artifact: the Nth copy is the Nth artifact of the seed's order
    PROGRESSIVE_ARTIFACT_ORDER = (slot_data and slot_data["progressive_artifact_order"]) or {}
    PROGRESSIVE_ARTIFACT_COUNT = 0
    LOCAL_ITEMS = {}; GLOBAL_ITEMS = {}
end

PROGRESSIVE_ARTIFACT_ID = 2322951        -- AP id of "Progressive Artifact"
AP_ITEM_ID_BASE = 2322432                -- AP id = this + the in-game item id
PROGRESSIVE_ARTIFACT_ORDER = {}
PROGRESSIVE_ARTIFACT_COUNT = 0

-- Light the artifact the next Progressive Artifact gives.
local function onProgressiveArtifact()
    PROGRESSIVE_ARTIFACT_COUNT = PROGRESSIVE_ARTIFACT_COUNT + 1
    local artifact = PROGRESSIVE_ARTIFACT_ORDER[PROGRESSIVE_ARTIFACT_COUNT]
    local v = artifact and ITEM_MAPPING[AP_ITEM_ID_BASE + math.floor(artifact)]
    local obj = v and Tracker:FindObjectForCode(v[1])
    if obj then obj.Active = true end
end

function onItem(index, item_id, item_name, player_number)
    if not AUTOTRACKER_ENABLE_ITEM_TRACKING then return end
    if index <= CUR_INDEX then return end
    CUR_INDEX = index
    if item_id == PROGRESSIVE_ARTIFACT_ID then
        onProgressiveArtifact()
        return
    end
    local v = ITEM_MAPPING[item_id]
    if not v or not v[1] then return end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if     v[2] == "toggle"      then obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then obj.CurrentStage = obj.CurrentStage + 1
            else obj.Active = true end
        elseif v[2] == "consumable"  then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment end
    end
end

function onLocation(location_id, location_name)
    if not AUTOTRACKER_ENABLE_LOCATION_TRACKING then return end
    local v = LOCATION_MAPPING[location_id]
    if not v then return end
    for _, w in ipairs(v) do
        if w:sub(1,1) == "@" then
            -- chest section path
            local obj = Tracker:FindObjectForCode(w)
            if obj then obj.AvailableChestCount = 0 end
        elseif w:sub(1,1) == "=" then
            -- cycle stage-set: "=item_code:target_stage"
            -- Uses max() so reconnect replays are idempotent (never go backwards).
            local sep = w:find(":", 2, true)
            local code = w:sub(2, sep - 1)
            local stage = tonumber(w:sub(sep + 1))
            local obj = Tracker:FindObjectForCode(code)
            if obj then
                if not obj.Active then obj.Active = true end
                if obj.CurrentStage < stage then obj.CurrentStage = stage end
            end
        else
            local obj = Tracker:FindObjectForCode(w)
            if obj then
                if obj.Type == "progressive" then obj.CurrentStage = obj.CurrentStage + 1
                else obj.Active = true end
            end
        end
    end
end

if AUTOTRACKER_ENABLE_ITEM_TRACKING    then Archipelago:AddItemHandler   ("item handler",     onItem)     end
if AUTOTRACKER_ENABLE_LOCATION_TRACKING then Archipelago:AddLocationHandler("location handler", onLocation) end
Archipelago:AddClearHandler("clear handler", onClear)

-- Hints: a check in this world that has a hint (from !hint, another
-- player's hint for their item here, or a Mog Stamp) gets PopTracker's
-- highlight, a coloured border on its pin and section, by the hint's
-- priority: yellow for Priority (and Unspecified, which PopTracker would
-- otherwise not show), blue for No Priority. Hints for this player's items
-- in other worlds have no pin here.
-- The server keeps the slot's hints in _read_hints_<team>_<slot>.
HINT_HIGHLIGHT = {}
if Highlight then
    HINT_HIGHLIGHT = {
        [0] = Highlight.Priority,
        [10] = Highlight.NoPriority,
        [20] = Highlight.Avoid,
        [30] = Highlight.Priority,
        [40] = Highlight.None,
    }
end

local function hints_key()
    return "_read_hints_" .. Archipelago.TeamNumber .. "_" .. Archipelago.PlayerNumber
end

local function show_hints(hints)
    if not Highlight or type(hints) ~= "table" then
        return
    end
    for _, hint in ipairs(hints) do
        if hint.finding_player == Archipelago.PlayerNumber then
            local mapping = LOCATION_MAPPING[hint.location]
            local status = hint.found and 40 or (hint.status or 0)
            for _, code in ipairs(mapping or {}) do
                if code:sub(1, 1) == "@" then
                    local obj = Tracker:FindObjectForCode(code)
                    if obj then
                        obj.Highlight = HINT_HIGHLIGHT[status] or Highlight.Priority
                    end
                end
            end
        end
    end
end

Archipelago:AddClearHandler("hint handler", function()
    Archipelago:SetNotify({hints_key()})
    Archipelago:Get({hints_key()})
end)
Archipelago:AddRetrievedHandler("hint handler", function(key, value)
    if key == hints_key() then show_hints(value) end
end)
Archipelago:AddSetReplyHandler("hint handler", function(key, value)
    if key == hints_key() then show_hints(value) end
end)
