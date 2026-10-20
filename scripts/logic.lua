-- The same rules as the AP world's logic (worlds/ffcc/rules.py).

-- $stage_key|<code>: a dungeon's chests are in logic once its key is found,
-- or always when the seed has no stage keys ("Stage Keys Required" off).
function stage_key(code)
    local on = Tracker:FindObjectForCode("stage_keys_on")
    if not (on and on.Active) then
        return true
    end
    local key = Tracker:FindObjectForCode("key_" .. code)
    return key ~= nil and key.Active
end

-- $river|<code>: a dungeon on a spot across the Jegon River (Plains of Fum,
-- Rebena Plains, the Abyss) needs the Ring of Life and Veo Lu Sluice, so the
-- river can be refilled when it dries up in Year 5. With Shuffle Loading
-- Zones the spot comes from the slot data (SetWorldZones).
local DUNGEON_OF_CODE = {
    rbp = "River Belle Path",
    gw = "Goblin Wall",
    moc = "The Mine of Cathuriges",
    tmf = "The Mushroom Forest",
    tida = "Tida",
    mm = "Moschet Manor",
    mk = "Mount Kilanda",
    dc = "Daemon's Court",
    sc = "Selepation Cave",
    vls = "Veo Lu Sluice",
    ld = "Lynari Desert",
    cc = "Conall Curach",
    rtr = "Rebena Te Ra",
    mv = "Mount Vellenge",
}
local ACROSS_RIVER = {
    ["Selepation Cave"] = true,
    ["Daemon's Court"] = true,
    ["Conall Curach"] = true,
    ["Rebena Te Ra"] = true,
    ["Mount Vellenge"] = true,
}
local SPOT_OF = {}      -- dungeon -> world-map spot; empty = every dungeon on its own

function SetWorldZones(zones)
    SPOT_OF = {}
    if type(zones) == "table" then
        for spot, dungeon in pairs(zones) do
            SPOT_OF[dungeon] = spot
        end
    end
end

function river(code)
    local dungeon = DUNGEON_OF_CODE[code]
    if not ACROSS_RIVER[SPOT_OF[dungeon] or dungeon] then
        return true
    end
    local ring = Tracker:FindObjectForCode("ring_of_life")
    return ring ~= nil and ring.Active and stage_key("vls")
end

-- $timed_chests: Rebena Te Ra chests 6 and 9 need tight timing alone. They are
-- in logic only with the "Rebena Te Ra Timed Chests" option; otherwise they
-- show as a sequence break.
TIMED_CHESTS_ON = false

function timed_chests()
    if TIMED_CHESTS_ON then
        return true
    end
    return AccessibilityLevel.SequenceBreak
end
