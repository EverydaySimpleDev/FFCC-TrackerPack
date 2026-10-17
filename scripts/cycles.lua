-- Moves each dungeon's cycle tracker up to the cycle the game is on. The FFCC
-- client puts every dungeon's cycle in the server's data storage as
-- ffcc_cycles_<team>_<slot> = {dungeon name: 1-3}.

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

local function cycles_key()
    return "ffcc_cycles_" .. Archipelago.TeamNumber .. "_" .. Archipelago.PlayerNumber
end

local function on_cycles(key, value)
    if key ~= cycles_key() or type(value) ~= "table" then
        return
    end
    for dungeon, cycle in pairs(value) do
        local code = CYCLE_CODES[dungeon]
        local obj = code and Tracker:FindObjectForCode(code)
        if obj and type(cycle) == "number" and cycle >= 2 then
            if not obj.Active then obj.Active = true end
            if obj.CurrentStage < cycle - 1 then obj.CurrentStage = cycle - 1 end
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
