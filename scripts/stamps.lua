-- Mog Stamps: lights the stamp items and clears the Moogle Nest pins of the
-- stamps the save has. The FFCC client puts them in the server's data
-- storage as ffcc_mog_stamps_<team>_<slot>: the 4 stamp bytes at 0x8021EF56
-- read as one big-endian number, a bit per nest. The pins only show with
-- the Mog Stamps goal or Mog Stamp Hints ($stamps_shown).

local STAMPS = {
    {bit = 536870912, code = "stamp_tipa", section = "@Mog Stamp - Tipa/Mog Stamp"},
    {bit = 1048576, code = "stamp_port_tipa", section = "@Mog Stamp - Port Tipa/Mog Stamp"},
    {bit = 268435456, code = "stamp_marrs_pass", section = "@Mog Stamp - Marr's Pass/Mog Stamp"},
    {bit = 2147483648, code = "stamp_alfitaria", section = "@Mog Stamp - Alfitaria/Mog Stamp"},
    {bit = 65536, code = "stamp_shella", section = "@Mog Stamp - Shella/Mog Stamp"},
    {bit = 1073741824, code = "stamp_the_fields_of_fum", section = "@Mog Stamp - The Fields of Fum/Mog Stamp"},
    {bit = 131072, code = "stamp_west_jegon_river", section = "@Mog Stamp - West Jegon River/Mog Stamp"},
    {bit = 524288, code = "stamp_leuda", section = "@Mog Stamp - Leuda/Mog Stamp"},
    {bit = 4, code = "stamp_mag_mell", section = "@Mog Stamp - Mag Mell/Mog Stamp"},
    {bit = 262144, code = "stamp_river_belle_path", section = "@Mog Stamp - River Belle Path/Mog Stamp"},
    {bit = 1024, code = "stamp_goblin_wall", section = "@Mog Stamp - Goblin Wall/Mog Stamp"},
    {bit = 8192, code = "stamp_the_mine_of_cathuriges", section = "@Mog Stamp - The Mine of Cathuriges/Mog Stamp"},
    {bit = 2097152, code = "stamp_the_mushroom_forest", section = "@Mog Stamp - The Mushroom Forest/Mog Stamp"},
    {bit = 16384, code = "stamp_tida", section = "@Mog Stamp - Tida/Mog Stamp"},
    {bit = 32768, code = "stamp_moschet_manor", section = "@Mog Stamp - Moschet Manor/Mog Stamp"},
    {bit = 8388608, code = "stamp_mount_kilanda", section = "@Mog Stamp - Mount Kilanda/Mog Stamp"},
    {bit = 4194304, code = "stamp_daemons_court", section = "@Mog Stamp - Daemon's Court/Mog Stamp"},
    {bit = 512, code = "stamp_selepation_cave", section = "@Mog Stamp - Selepation Cave/Mog Stamp"},
    {bit = 256, code = "stamp_veo_lu_sluice", section = "@Mog Stamp - Veo Lu Sluice/Mog Stamp"},
    {bit = 2048, code = "stamp_lynari_desert", section = "@Mog Stamp - Lynari Desert/Mog Stamp"},
    {bit = 4096, code = "stamp_conall_curach", section = "@Mog Stamp - Conall Curach/Mog Stamp"},
    {bit = 1, code = "stamp_rebena_te_ra", section = "@Mog Stamp - Rebena Te Ra/Mog Stamp"},
    {bit = 2, code = "stamp_mount_vellenge", section = "@Mog Stamp - Mount Vellenge/Mog Stamp"},
}

STAMPS_SHOWN = false

function stamps_shown()
    return STAMPS_SHOWN
end

local function stamps_key()
    return "ffcc_mog_stamps_" .. Archipelago.TeamNumber .. "_" .. Archipelago.PlayerNumber
end

-- numbers from the server can arrive as floats, so the bits are tested
-- with arithmetic
local function has_bit(value, bit)
    return math.floor(value / bit) % 2 == 1
end

local function show_stamps(value)
    if type(value) ~= "number" then
        return
    end
    for _, stamp in ipairs(STAMPS) do
        if has_bit(value, stamp.bit) then
            local item = Tracker:FindObjectForCode(stamp.code)
            if item and not item.Active then
                item.Active = true
            end
            local section = Tracker:FindObjectForCode(stamp.section)
            if section and section.AvailableChestCount ~= 0 then
                section.AvailableChestCount = 0
            end
        end
    end
end

if Archipelago and Archipelago.AddSetReplyHandler then
    Archipelago:AddClearHandler("mog stamps", function(slot_data)
        local goal = slot_data and tonumber(slot_data["victory_goal"])
        local hints = slot_data and slot_data["mog_stamp_hints"]
        STAMPS_SHOWN = goal == 3 or hints == true or (type(hints) == "number" and hints ~= 0)
        for _, stamp in ipairs(STAMPS) do
            local item = Tracker:FindObjectForCode(stamp.code)
            if item then
                item.Active = false
            end
            local section = Tracker:FindObjectForCode(stamp.section)
            if section then
                section.AvailableChestCount = section.ChestCount
            end
        end
        Archipelago:SetNotify({stamps_key()})
        Archipelago:Get({stamps_key()})
    end)
    Archipelago:AddRetrievedHandler("mog stamps", function(key, value)
        if key == stamps_key() then show_stamps(value) end
    end)
    Archipelago:AddSetReplyHandler("mog stamps", function(key, value)
        if key == stamps_key() then show_stamps(value) end
    end)
end
