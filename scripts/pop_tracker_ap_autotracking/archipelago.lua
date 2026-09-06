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
        -- skip "=code:N" entries; handled separately below
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
    LOCAL_ITEMS = {}; GLOBAL_ITEMS = {}
end

function onItem(index, item_id, item_name, player_number)
    if not AUTOTRACKER_ENABLE_ITEM_TRACKING then return end
    if index <= CUR_INDEX then return end
    CUR_INDEX = index
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
