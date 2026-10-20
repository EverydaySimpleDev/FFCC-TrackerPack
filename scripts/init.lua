Tracker:AddItems("items/items.json")
Tracker:AddItems("items/stage_keys.json")
Tracker:AddItems("items/equipment.json")
Tracker:AddItems("items/map_options.json")
ScriptHost:LoadScript("scripts/logic.lua")
Tracker:AddMaps("maps/maps.json")
Tracker:AddLocations("locations/locations.json")
Tracker:AddLayouts("layouts/dungeon_maps_h.json")
Tracker:AddLayouts("layouts/tracker.json")
ScriptHost:LoadScript("scripts/map_options.lua")

if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/pop_tracker_ap_autotracking/archipelago.lua")
    ScriptHost:LoadScript("scripts/cycles.lua")
end
