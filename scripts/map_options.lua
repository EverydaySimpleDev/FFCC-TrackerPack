-- Switches the dungeon map tabs to the image variant the Map Options ask for:
-- hotspot icons on or off, and which enemies' letters are drawn. With Auto Tab
-- on, it also opens the map of the dungeon the player is in, which the FFCC
-- client puts in the server's data storage as ffcc_stage_<team>_<slot>.

local ENEMY_SUFFIX = {[0] = "", [1] = "e", [2] = "e1", [3] = "e2", [4] = "e3"}
local current = nil
local stage = ""

function ShowStageTab()
    local auto = Tracker:FindObjectForCode("auto_tab")
    if stage ~= "" and auto and auto.Active then
        pcall(function() Tracker:UiHint("ActivateTab", stage) end)
    end
end

function UpdateMapVariant()
    local hotspots = Tracker:FindObjectForCode("show_hotspots")
    local enemies = Tracker:FindObjectForCode("show_enemies")
    local suffix = ((hotspots and hotspots.Active) and "h" or "") ..
        (ENEMY_SUFFIX[enemies and enemies.CurrentStage or 0] or "")
    if suffix == "" then suffix = "plain" end
    if suffix ~= current then
        current = suffix
        Tracker:AddLayouts("layouts/dungeon_maps_" .. suffix .. ".json")
        ShowStageTab()
    end
end

ScriptHost:AddWatchForCode("map_options_hotspots", "show_hotspots", UpdateMapVariant)
ScriptHost:AddWatchForCode("map_options_enemies", "show_enemies", UpdateMapVariant)
ScriptHost:AddWatchForCode("map_options_auto_tab", "auto_tab", ShowStageTab)
UpdateMapVariant()

local function stage_key()
    return "ffcc_stage_" .. Archipelago.TeamNumber .. "_" .. Archipelago.PlayerNumber
end

local function on_stage(key, value)
    if key == stage_key() and type(value) == "string" and value ~= stage then
        stage = value
        ShowStageTab()
    end
end

if Archipelago and Archipelago.AddSetReplyHandler then
    Archipelago:AddClearHandler("stage tab", function()
        stage = ""
        Archipelago:SetNotify({stage_key()})
        Archipelago:Get({stage_key()})
    end)
    Archipelago:AddRetrievedHandler("stage tab", on_stage)
    Archipelago:AddSetReplyHandler("stage tab", function(key, value) on_stage(key, value) end)
end
