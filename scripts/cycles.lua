-- Moves each dungeon's cycle tracker up to the cycle the game is on, and the
-- year tracker up to the game's year. The FFCC client puts them in the
-- server's data storage as ffcc_cycles_<team>_<slot> = {dungeon name: 1-3,
-- Year = n}.

local CYCLE_CODES = {
    ["River Belle Path"] = "cycle_rbp",
    ["Goblin Wall"] = "cycle_gw",
    ["The Mine of Cathuriges"] = "cycle_moc",
    ["The Mushroom Forest"] = "cycle_tmf",
    ["Tida"] = "cycle_tida",
    ["Moschet Manor"] = "cycle_mm",
    ["Mount Kilanda"] = "cycle_mk",
    ["Daemon's Court"] = "cycle_dc",
    ["Selepation Cave"] = "cycle_sc",
    ["Veo Lu Sluice"] = "cycle_vls",
    ["Lynari Desert"] = "cycle_ld",
    ["Conall Curach"] = "cycle_cc",
    ["Rebena Te Ra"] = "cycle_rtr",
}

-- one entry per stage of the Year Tracker item
local YEAR_STAGES = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

local function cycles_key()
    return "ffcc_cycles_" .. Archipelago.TeamNumber .. "_" .. Archipelago.PlayerNumber
end

local function on_cycles(key, value)
    if key ~= cycles_key() or type(value) ~= "table" then
        return
    end
    local year = Tracker:FindObjectForCode("year_tracker")
    if year and type(value["Year"]) == "number" then
        -- stage 0 is Year 1
        local stage = math.min(math.floor(value["Year"]) - 1, #YEAR_STAGES - 1)
        if stage > year.CurrentStage then
            year.CurrentStage = stage
        end
    end
    for dungeon, cycle in pairs(value) do
        local code = CYCLE_CODES[dungeon]
        local obj = code and Tracker:FindObjectForCode(code)
        -- The cycle icons have an "off" state, so in Lua stage 0 is off and
        -- stage N is Cycle N. Numbers from the server can arrive as floats
        -- (2.0), and a float CurrentStage is ignored, hence math.floor.
        local stage = type(cycle) == "number" and math.floor(cycle) or 0
        if obj and stage >= 1 and obj.CurrentStage < stage then
            obj.CurrentStage = stage
        end
    end
end

if Archipelago and Archipelago.AddSetReplyHandler then
    Archipelago:AddClearHandler("cycle tracking", function()
        Archipelago:SetNotify({cycles_key()})
        Archipelago:Get({cycles_key()})
    end)
    Archipelago:AddRetrievedHandler("cycle tracking", on_cycles)
    Archipelago:AddSetReplyHandler("cycle tracking", function(key, value) on_cycles(key, value) end)
end
