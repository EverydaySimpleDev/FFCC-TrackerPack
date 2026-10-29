BONUS_DUNGEONS = {
    ["River Belle Path"] = {code = "rbp", points = {0, 95, 119, 149}},
    ["Goblin Wall"] = {code = "gw", points = {0, 110, 138, 172}},
    ["The Mine of Cathuriges"] = {code = "moc", points = {0, 116, 145, 181}},
    ["The Mushroom Forest"] = {code = "tmf", points = {0, 108, 135, 169}},
    ["Tida"] = {code = "tida", points = {0, 155, 193, 241}},
    ["Moschet Manor"] = {code = "mm", points = {0, 84, 105, 132}},
    ["Mount Kilanda"] = {code = "mk", points = {0, 102, 127, 159}},
    ["Daemon's Court"] = {code = "dc", points = {0, 103, 128, 160}},
    ["Selepation Cave"] = {code = "sc", points = {0, 158, 197, 246}},
    ["Veo Lu Sluice"] = {code = "vls", points = {0, 92, 115, 143}},
    ["Lynari Desert"] = {code = "ld", points = {0, 144, 180, 226}},
    ["Conall Curach"] = {code = "cc", points = {0, 193, 240, 301}},
    ["Rebena Te Ra"] = {code = "rtr", points = {0, 149, 186, 232}},
}

-- the vanilla pools: 8 entries of 4 item ids. A seed's own pools replace these
BONUS_VANILLA = {
    ["River Belle Path"] = {{159, 182, 208, 219}, {160, 183, 209, 219}, {161, 198, 208, 295}, {165, 193, 209, 295}, {166, 189, 214, 296}, {169, 164, 211, 407}, {159, 182, 209, 297}, {160, 183, 206, 320}},
    ["Goblin Wall"] = {{161, 196, 210, 228}, {163, 187, 210, 228}, {162, 195, 212, 219}, {178, 200, 210, 219}, {170, 199, 212, 346}, {168, 190, 212, 297}, {178, 197, 214, 460}, {177, 191, 210, 321}},
    ["The Mine of Cathuriges"] = {{159, 182, 208, 228}, {166, 183, 209, 219}, {160, 188, 208, 228}, {161, 193, 211, 219}, {169, 194, 214, 407}, {177, 189, 214, 297}, {163, 195, 222, 322}, {175, 196, 228, 172}},
    ["The Mushroom Forest"] = {{159, 182, 208, 228}, {164, 183, 209, 219}, {160, 186, 208, 228}, {161, 193, 211, 219}, {169, 194, 214, 346}, {177, 189, 214, 297}, {161, 193, 219, 424}, {162, 194, 228, 326}},
    ["Tida"] = {{179, 182, 209, 220}, {159, 198, 210, 219}, {160, 193, 213, 220}, {176, 194, 210, 169}, {181, 164, 214, 346}, {188, 201, 214, 297}, {176, 193, 220, 407}, {177, 194, 474, 331}},
    ["Moschet Manor"] = {{164, 184, 208, 220}, {177, 199, 209, 228}, {178, 185, 211, 229}, {163, 195, 212, 220}, {165, 186, 220, 229}, {171, 189, 214, 297}, {176, 220, 407, 332}, {174, 197, 220, 434}},
    ["Mount Kilanda"] = {{168, 185, 207, 229}, {176, 198, 207, 230}, {177, 193, 204, 223}, {178, 194, 207, 223}, {170, 199, 205, 230}, {164, 189, 223, 297}, {179, 187, 407, 330}, {173, 188, 204, 409}},
    ["Daemon's Court"] = {{166, 196, 208, 220}, {159, 187, 209, 229}, {160, 197, 217, 220}, {161, 182, 210, 229}, {181, 188, 214, 229}, {167, 200, 220, 297}, {164, 198, 442, 323}, {165, 199, 216, 432}},
    ["Selepation Cave"] = {{167, 182, 208, 220}, {162, 188, 209, 225}, {163, 183, 210, 229}, {176, 184, 218, 225}, {169, 198, 211, 424}, {179, 201, 229, 297}, {166, 186, 225, 328}, {167, 187, 425, 215}},
    ["Veo Lu Sluice"] = {{165, 193, 208, 224}, {177, 186, 209, 229}, {178, 194, 213, 229}, {159, 195, 210, 224}, {180, 187, 217, 229}, {166, 190, 224, 297}, {177, 196, 451, 324}, {178, 197, 202, 424}},
    ["Lynari Desert"] = {{171, 186, 204, 230}, {164, 190, 211, 221}, {165, 187, 205, 221}, {180, 188, 212, 230}, {166, 200, 213, 408}, {167, 198, 214, 297}, {168, 199, 221, 327}, {179, 192, 424, 231}},
    ["Conall Curach"] = {{181, 186, 217, 221}, {164, 201, 218, 226}, {165, 187, 214, 230}, {166, 188, 217, 226}, {167, 201, 218, 230}, {169, 198, 226, 297}, {179, 199, 325, 411}, {168, 192, 424, 227}},
    ["Rebena Te Ra"] = {{170, 186, 204, 230}, {164, 189, 211, 221}, {165, 187, 205, 230}, {166, 188, 212, 221}, {171, 198, 213, 230}, {167, 190, 221, 297}, {168, 199, 410, 329}, {179, 203, 207, 491}},
}

BONUS_ITEM_NAMES = {
    [159] = "Shuriken",
    [160] = "Maneater",
    [161] = "Double Axe",
    [162] = "Ashura",
    [163] = "Kaiser Knuckles",
    [164] = "Flametongue",
    [165] = "Ice Brand",
    [166] = "Loaded Dice",
    [167] = "Ogrekiller",
    [168] = "Engetsurin",
    [169] = "Sasuke's Blade",
    [170] = "Mjollnir",
    [171] = "Masquerade",
    [172] = "Murasame",
    [173] = "Masamune",
    [174] = "Gekkabijin",
    [175] = "Onion Sword",
    [176] = "Power Wristband",
    [177] = "Green Beret",
    [178] = "Fang Charm",
    [179] = "Twisted Headband",
    [180] = "Heavy Armband",
    [181] = "Giant's Glove",
    [182] = "Dragon's Whisker",
    [183] = "Mage Masher",
    [184] = "Rune Staff",
    [185] = "Book of Light",
    [186] = "Sage's Staff",
    [187] = "Wonder Wand",
    [188] = "Rune Bell",
    [189] = "Mage's Staff",
    [190] = "Noah's Lute",
    [191] = "Galatyn",
    [192] = "Tome of Ultima",
    [193] = "Silver Bracer",
    [194] = "Cat's Bell",
    [195] = "Faerie Ring",
    [196] = "Winged Cap",
    [197] = "Candy Ring",
    [198] = "Kris",
    [199] = "Red Slippers",
    [200] = "Dark Matter",
    [201] = "Gold Hairpin",
    [202] = "Taotie Motif",
    [203] = "Ribbon",
    [204] = "Main Gauche",
    [205] = "Chicken Knife",
    [206] = "Save the Queen",
    [207] = "Drill",
    [208] = "Buckler",
    [209] = "Silver Spectacles",
    [210] = "Sparkling Bracer",
    [211] = "Black Hood",
    [212] = "Helm of Arai",
    [213] = "Elven Mantle",
    [214] = "Wonder Bangle",
    [215] = "Ring of Protection",
    [216] = "Aegis",
    [217] = "Rat's Tail",
    [218] = "Teddy Bear",
    [219] = "Moogle Pocket",
    [220] = "Chocobo Pocket",
    [221] = "Gobbie Pocket",
    [222] = "Ultimate Pocket",
    [223] = "Ring of Fire",
    [224] = "Ring of Blizzard",
    [225] = "Ring of Thunder",
    [226] = "Ring of Cure",
    [227] = "Ring of Life",
    [228] = "Earth Pendant",
    [229] = "Moon Pendant",
    [230] = "Star Pendant",
    [231] = "Sun Pendant",
    [256] = "Stone of Fire",
    [257] = "Stone of Blizzard",
    [258] = "Stone of Thunder",
    [261] = "Stone of Cure",
    [262] = "Stone of Clear",
    [263] = "Stone of Life",
    [293] = "Phoenix Down",
    [294] = "Bronze",
    [295] = "Iron",
    [296] = "Mythril",
    [297] = "Orichalcum",
    [298] = "Diamond Ore",
    [299] = "Gold",
    [300] = "Silver",
    [301] = "Bronze Shard",
    [302] = "Iron Shard",
    [303] = "Tiny Crystal",
    [304] = "Crystal Ball",
    [305] = "Ruby",
    [306] = "Jade",
    [307] = "Alloy",
    [308] = "Magma Rock",
    [309] = "Chilly Gel",
    [310] = "Thunderball",
    [311] = "Holy Water",
    [312] = "Heavenly Dust",
    [313] = "Yellow Feather",
    [314] = "Blue Silk",
    [315] = "White Silk",
    [316] = "Fiend's Claw",
    [317] = "Devil's Claw",
    [318] = "Faerie's Tear",
    [319] = "Angel's Tear",
    [320] = "Ancient Sword",
    [321] = "Cursed Crook",
    [322] = "Orc Belt",
    [323] = "King's Scale",
    [324] = "Green Sphere",
    [325] = "Dragon's Fang",
    [326] = "Malboro Seed",
    [327] = "Desert Fang",
    [328] = "Wind Crystal",
    [329] = "Ethereal Orb",
    [330] = "Red Eye",
    [331] = "Dweomer Spore",
    [332] = "Lord's Robe",
    [333] = "Griffin's Wing",
    [334] = "Cerberus Fang",
    [335] = "Needle",
    [336] = "Hard Shell",
    [337] = "Worm Antenna",
    [338] = "Toad Oil",
    [339] = "Jagged Scythe",
    [340] = "Ogre Fang",
    [341] = "Chimera's Horn",
    [343] = "Coeurl Whisker",
    [344] = "Zu's Beak",
    [345] = "Cockatrice Scale",
    [346] = "Ancient Potion",
    [347] = "Shiny Shard",
    [348] = "Gigas Claw",
    [349] = "Gear",
    [350] = "Pressed Flower",
    [351] = "Remedy",
    [355] = "Flower Seed",
    [356] = "Strange Seed",
    [357] = "Fruit Seed",
    [358] = "Fruit Seed",
    [359] = "Fruit Seed",
    [360] = "Vegetable Seed",
    [361] = "Vegetable Seed",
    [362] = "Vegetable Seed",
    [363] = "Wheat Seed",
    [364] = "Worn Bandanna",
    [365] = "Shella Mark",
    [366] = "Kilanda Sulfur",
    [367] = "Cactus Flower",
    [369] = "Ultimite",
    [370] = "Dark Sphere",
    [381] = "Striped Apple",
    [382] = "Cherry Cluster",
    [383] = "Rainbow Grapes",
    [384] = "Star Carrot",
    [385] = "Gourd Potato",
    [386] = "Round Corn",
    [387] = "Meat",
    [388] = "Fish",
    [389] = "Bannock",
    [390] = "Spring Water",
    [391] = "Milk",
    [392] = "Strange Liquid",
    [401] = "Novice's Weapon",
    [402] = "Warrior's Weapon",
    [403] = "Valiant Weapon",
    [404] = "Mighty Weapon",
    [405] = "Victorious Weapon",
    [406] = "Master's Weapon",
    [407] = "Legendary Weapon",
    [408] = "Hero's Weapon",
    [409] = "Celestial Weapon",
    [410] = "Dark Weapon",
    [411] = "Lunar Weapon",
    [412] = "Bronze Armor",
    [413] = "Iron Armor",
    [414] = "Mythril Armor",
    [415] = "Flame Armor",
    [416] = "Frost Armor",
    [417] = "Lightning Armor",
    [418] = "Time Armor",
    [419] = "Eternal Armor",
    [420] = "Pure Armor",
    [421] = "Holy Armor",
    [422] = "Gold Armor",
    [423] = "Radiant Armor",
    [424] = "Diamond Armor",
    [425] = "Earth Armor",
    [426] = "Iron Shield",
    [427] = "Mythril Shield",
    [428] = "Flame Shield",
    [429] = "Frost Shield",
    [430] = "Lightning Shield",
    [431] = "Holy Shield",
    [432] = "Diamond Shield",
    [433] = "Magic Shield",
    [434] = "Legendary Shield",
    [435] = "Bronze Gloves",
    [436] = "Iron Gloves",
    [437] = "Mythril Gloves",
    [438] = "Flame Gloves",
    [439] = "Frost Gloves",
    [440] = "Lightning Gloves",
    [441] = "Gold Gloves",
    [442] = "Diamond Gloves",
    [443] = "Bronze Sallet",
    [444] = "Iron Sallet",
    [445] = "Mythril Sallet",
    [446] = "Flame Sallet",
    [447] = "Frost Sallet",
    [448] = "Lightning Sallet",
    [449] = "Time Sallet",
    [450] = "Eternal Sallet",
    [451] = "Diamond Sallet",
    [452] = "Bronze Belt",
    [453] = "Iron Belt",
    [454] = "Mythril Belt",
    [455] = "Flame Belt",
    [456] = "Frost Belt",
    [457] = "Lightning Belt",
    [458] = "Pure Belt",
    [459] = "Wind Belt",
    [460] = "Diamond Belt",
    [461] = "Flame Craft",
    [462] = "Frost Craft",
    [463] = "Lightning Craft",
    [464] = "Clockwork",
    [465] = "New Clockwork",
    [466] = "Blue Yarn",
    [467] = "White Yarn",
    [468] = "Gold Craft",
    [469] = "Wisdom Tome",
    [470] = "Wisdom Secrets",
    [471] = "Lady's Accessories",
    [472] = "Speed Tome",
    [473] = "Speed Secrets",
    [474] = "Brigandology",
    [475] = "Zeal Kit",
    [476] = "Fiend Kit",
    [477] = "Daemon Kit",
    [478] = "Faerie Kit",
    [479] = "Angel Kit",
    [480] = "Ring of Light",
    [481] = "Eyewear Techniques",
    [482] = "Designer Glasses",
    [483] = "Healing Kit",
    [484] = "Fashion Kit",
    [485] = "Goggle Techniques",
    [486] = "Designer Goggles",
    [487] = "Soul of the Lion",
    [488] = "Soul of the Dragon",
    [489] = "Magic Tome",
    [490] = "Sorcery Tome",
    [491] = "Forbidden Tome",
    [492] = "Greatest Weapon",
    [493] = "Ring of Invincibility",
}

BONUS_ITEM_ICONS = {
    [159] = "cell11.png",
    [160] = "cell11.png",
    [161] = "cell11.png",
    [162] = "cell11.png",
    [163] = "cell11.png",
    [164] = "cell11.png",
    [165] = "cell11.png",
    [166] = "cell11.png",
    [167] = "cell11.png",
    [168] = "cell11.png",
    [169] = "cell11.png",
    [170] = "cell11.png",
    [171] = "cell11.png",
    [172] = "cell11.png",
    [173] = "cell11.png",
    [174] = "cell11.png",
    [175] = "cell11.png",
    [176] = "cell12.png",
    [177] = "cell12.png",
    [178] = "cell12.png",
    [179] = "cell12.png",
    [180] = "cell12.png",
    [181] = "cell12.png",
    [182] = "cell11.png",
    [183] = "cell11.png",
    [184] = "cell11.png",
    [185] = "cell11.png",
    [186] = "cell11.png",
    [187] = "cell11.png",
    [188] = "cell11.png",
    [189] = "cell11.png",
    [190] = "cell11.png",
    [191] = "cell11.png",
    [192] = "cell12.png",
    [193] = "cell12.png",
    [194] = "cell12.png",
    [195] = "cell12.png",
    [196] = "cell12.png",
    [197] = "cell12.png",
    [198] = "cell12.png",
    [199] = "cell12.png",
    [200] = "cell12.png",
    [201] = "cell12.png",
    [202] = "cell12.png",
    [203] = "cell12.png",
    [204] = "cell11.png",
    [205] = "cell11.png",
    [206] = "cell11.png",
    [207] = "cell12.png",
    [208] = "cell12.png",
    [209] = "cell12.png",
    [210] = "cell12.png",
    [211] = "cell12.png",
    [212] = "cell12.png",
    [213] = "cell12.png",
    [214] = "cell12.png",
    [215] = "cell12.png",
    [216] = "cell12.png",
    [217] = "cell12.png",
    [218] = "cell12.png",
    [219] = "cell13.png",
    [220] = "cell13.png",
    [221] = "cell13.png",
    [222] = "cell13.png",
    [223] = "cell15.png",
    [224] = "cell15.png",
    [225] = "cell15.png",
    [226] = "cell15.png",
    [227] = "cell15.png",
    [228] = "cell14.png",
    [229] = "cell14.png",
    [230] = "cell14.png",
    [231] = "cell14.png",
    [256] = "cell16.png",
    [257] = "cell16.png",
    [258] = "cell16.png",
    [261] = "cell17.png",
    [262] = "cell17.png",
    [263] = "cell17.png",
    [293] = "cell28.png",
    [294] = "cell18.png",
    [295] = "cell18.png",
    [296] = "cell18.png",
    [297] = "cell18.png",
    [298] = "cell38.png",
    [299] = "cell38.png",
    [300] = "cell38.png",
    [301] = "cell38.png",
    [302] = "cell38.png",
    [303] = "cell38.png",
    [304] = "cell38.png",
    [305] = "cell38.png",
    [306] = "cell38.png",
    [307] = "cell38.png",
    [308] = "cell38.png",
    [309] = "cell38.png",
    [310] = "cell38.png",
    [311] = "cell38.png",
    [312] = "cell38.png",
    [313] = "cell38.png",
    [314] = "cell38.png",
    [315] = "cell38.png",
    [316] = "cell38.png",
    [317] = "cell38.png",
    [318] = "cell38.png",
    [319] = "cell38.png",
    [320] = "cell38.png",
    [321] = "cell38.png",
    [322] = "cell38.png",
    [323] = "cell38.png",
    [324] = "cell38.png",
    [325] = "cell38.png",
    [326] = "cell38.png",
    [327] = "cell38.png",
    [328] = "cell38.png",
    [329] = "cell38.png",
    [330] = "cell38.png",
    [331] = "cell38.png",
    [332] = "cell38.png",
    [333] = "cell38.png",
    [334] = "cell38.png",
    [335] = "cell38.png",
    [336] = "cell38.png",
    [337] = "cell38.png",
    [338] = "cell38.png",
    [339] = "cell38.png",
    [340] = "cell38.png",
    [341] = "cell38.png",
    [343] = "cell38.png",
    [344] = "cell38.png",
    [345] = "cell38.png",
    [346] = "cell38.png",
    [347] = "cell38.png",
    [348] = "cell38.png",
    [349] = "cell38.png",
    [350] = "cell38.png",
    [351] = "cell38.png",
    [355] = "cell09.png",
    [356] = "cell09.png",
    [357] = "cell09.png",
    [358] = "cell09.png",
    [359] = "cell09.png",
    [360] = "cell09.png",
    [361] = "cell09.png",
    [362] = "cell09.png",
    [363] = "cell09.png",
    [364] = "cell38.png",
    [365] = "cell38.png",
    [366] = "cell38.png",
    [367] = "cell38.png",
    [369] = "cell38.png",
    [370] = "cell38.png",
    [381] = "cell20.png",
    [382] = "cell21.png",
    [383] = "cell22.png",
    [384] = "cell23.png",
    [385] = "cell24.png",
    [386] = "cell25.png",
    [387] = "cell26.png",
    [388] = "cell27.png",
    [389] = "cell37.png",
    [390] = "cell19.png",
    [391] = "cell19.png",
    [392] = "cell19.png",
    [401] = "cell34.png",
    [402] = "cell34.png",
    [403] = "cell34.png",
    [404] = "cell34.png",
    [405] = "cell34.png",
    [406] = "cell34.png",
    [407] = "cell34.png",
    [408] = "cell34.png",
    [409] = "cell34.png",
    [410] = "cell34.png",
    [411] = "cell34.png",
    [412] = "cell34.png",
    [413] = "cell34.png",
    [414] = "cell34.png",
    [415] = "cell34.png",
    [416] = "cell34.png",
    [417] = "cell34.png",
    [418] = "cell34.png",
    [419] = "cell34.png",
    [420] = "cell34.png",
    [421] = "cell34.png",
    [422] = "cell34.png",
    [423] = "cell34.png",
    [424] = "cell34.png",
    [425] = "cell34.png",
    [426] = "cell34.png",
    [427] = "cell34.png",
    [428] = "cell34.png",
    [429] = "cell34.png",
    [430] = "cell34.png",
    [431] = "cell34.png",
    [432] = "cell34.png",
    [433] = "cell34.png",
    [434] = "cell34.png",
    [435] = "cell34.png",
    [436] = "cell34.png",
    [437] = "cell34.png",
    [438] = "cell34.png",
    [439] = "cell34.png",
    [440] = "cell34.png",
    [441] = "cell34.png",
    [442] = "cell34.png",
    [443] = "cell34.png",
    [444] = "cell34.png",
    [445] = "cell34.png",
    [446] = "cell34.png",
    [447] = "cell34.png",
    [448] = "cell34.png",
    [449] = "cell34.png",
    [450] = "cell34.png",
    [451] = "cell34.png",
    [452] = "cell34.png",
    [453] = "cell34.png",
    [454] = "cell34.png",
    [455] = "cell34.png",
    [456] = "cell34.png",
    [457] = "cell34.png",
    [458] = "cell34.png",
    [459] = "cell34.png",
    [460] = "cell34.png",
    [461] = "cell34.png",
    [462] = "cell34.png",
    [463] = "cell34.png",
    [464] = "cell34.png",
    [465] = "cell34.png",
    [466] = "cell34.png",
    [467] = "cell34.png",
    [468] = "cell34.png",
    [469] = "cell34.png",
    [470] = "cell34.png",
    [471] = "cell34.png",
    [472] = "cell34.png",
    [473] = "cell34.png",
    [474] = "cell34.png",
    [475] = "cell34.png",
    [476] = "cell34.png",
    [477] = "cell34.png",
    [478] = "cell34.png",
    [479] = "cell34.png",
    [480] = "cell34.png",
    [481] = "cell34.png",
    [482] = "cell34.png",
    [483] = "cell34.png",
    [484] = "cell34.png",
    [485] = "cell34.png",
    [486] = "cell34.png",
    [487] = "cell34.png",
    [488] = "cell34.png",
    [489] = "cell34.png",
    [490] = "cell34.png",
    [491] = "cell34.png",
    [492] = "cell34.png",
    [493] = "cell34.png",
}

local CYCLE_START = {0, 2, 4}           -- entry offered = cycle start + tier
local pools = BONUS_VANILLA
local records = {}                      -- picks, from the FFCC client
local live = {}                         -- the current run: {dungeon, cycle, score}
local marks = {}                        -- dungeon -> {item id = true}, marked by clicking
local slots = {}                        -- code -> {dungeon, tier, index, id}
local labels = {}                       -- code -> {dungeon, tier}

local function item_name(id)
    return BONUS_ITEM_NAMES[id] or string.format("item 0x%03x", id)
end

local function make_item(code)
    local item = ScriptHost:CreateLuaItem()
    item.Name = ""
    item.Icon = ImageReference:FromPackRelativePath("images/bonus/tier.png")
    item.CanProvideCodeFunc = function(self, wanted) return wanted == code end
    item.ProvidesCodeFunc = function(self, wanted) return 0 end
    item.OnLeftClickFunc = function(self) end
    item.OnRightClickFunc = function(self) end
    return item
end

-- Clicking an item marks it collected (left) or unmarks it (right), for games
-- played without the AP client. Picks the client recorded stay picked.
local function set_mark(dungeon, id, on)
    if id == nil then return end
    marks[dungeon] = marks[dungeon] or {}
    marks[dungeon][id] = on or nil
    BonusRefresh()
end

for dungeon, info in pairs(BONUS_DUNGEONS) do
    for tier = 1, 4 do
        local code = "bonus_" .. info.code .. "_t" .. tier
        labels[code] = {dungeon = dungeon, tier = tier, item = make_item(code)}
        for index = 1, 4 do
            local slot_code = code .. "_" .. index
            local slot = {dungeon = dungeon, tier = tier, index = index, item = make_item(slot_code)}
            slot.item.OnLeftClickFunc = function(self)
                local marked = slot.id and marks[dungeon] and marks[dungeon][slot.id]
                set_mark(dungeon, slot.id, not marked)
            end
            slot.item.OnRightClickFunc = function(self) set_mark(dungeon, slot.id, false) end
            slots[slot_code] = slot
        end
    end
    -- the dungeon's marks are saved with the tracker state, on its tier 1 label
    local holder = labels["bonus_" .. info.code .. "_t1"].item
    holder.SaveFunc = function(self)
        local ids = {}
        for id in pairs(marks[dungeon] or {}) do table.insert(ids, id) end
        return {marked = ids}
    end
    holder.LoadFunc = function(self, data)
        marks[dungeon] = {}
        if type(data) == "table" and type(data.marked) == "table" then
            for _, id in pairs(data.marked) do marks[dungeon][math.floor(id)] = true end
        end
        BonusRefresh()
    end
end

local function current_cycle(dungeon)
    local obj = Tracker:FindObjectForCode("cycle_" .. BONUS_DUNGEONS[dungeon].code)
    local stage = obj and obj.CurrentStage or 0
    if stage < 1 then return 1 end
    return math.min(stage, 3)
end

local function picked(dungeon, id)
    local record = records[dungeon]
    if type(record) ~= "table" or type(record.picked) ~= "table" then return false end
    for _, v in pairs(record.picked) do
        if math.floor(v) == id then return true end
    end
    return false
end

local function marked(dungeon, id)
    return marks[dungeon] ~= nil and marks[dungeon][id] == true
end

-- the current run's score in `dungeon`, or nil when not playing it
local function live_score(dungeon)
    if type(live) ~= "table" or live.dungeon ~= dungeon or type(live.score) ~= "number" then return nil end
    return math.floor(live.score)
end

function BonusRefresh()
    for _, label in pairs(labels) do
        local info = BONUS_DUNGEONS[label.dungeon]
        local cycle = current_cycle(label.dungeon)
        local points = info.points[label.tier]
        local score = live_score(label.dungeon)
        label.item.Name = string.format("%s - Cycle %d, tier %d: %d+ bonus points (one player)",
                                        label.dungeon, cycle, label.tier, points)
            .. (score and string.format(" - this run: %d", score) or "")
        label.item:SetOverlay(tostring(points))
        if score and score >= points then
            label.item:SetOverlayColor("#44ff44")
        else
            label.item:SetOverlayColor("#ffffff")
        end
    end
    for _, slot in pairs(slots) do
        local cycle = current_cycle(slot.dungeon)
        local entry = (pools[slot.dungeon] or BONUS_VANILLA[slot.dungeon])[CYCLE_START[cycle] + slot.tier]
        local id = entry and math.floor(entry[slot.index]) or nil
        slot.id = id
        if id then
            local state = picked(slot.dungeon, id) and " (picked)" or marked(slot.dungeon, id) and " (marked)" or ""
            slot.item.Name = item_name(id) .. state
            slot.item.Icon = ImageReference:FromPackRelativePath("images/bonus/" .. (BONUS_ITEM_ICONS[id] or "tier.png"))
            slot.item.IconMods = state ~= "" and "" or "@disabled"
        end
    end
end

for dungeon, info in pairs(BONUS_DUNGEONS) do
    ScriptHost:AddWatchForCode("bonus cycle " .. info.code, "cycle_" .. info.code, function() BonusRefresh() end)
end

local function bonus_key()
    return "ffcc_bonus_" .. Archipelago.TeamNumber .. "_" .. Archipelago.PlayerNumber
end

local function live_key()
    return "ffcc_bonus_live_" .. Archipelago.TeamNumber .. "_" .. Archipelago.PlayerNumber
end

local function on_records(key, value)
    if key == bonus_key() then
        records = type(value) == "table" and value or {}
    elseif key == live_key() then
        live = type(value) == "table" and value or {}
    else
        return
    end
    BonusRefresh()
end

if Archipelago and Archipelago.AddSetReplyHandler then
    Archipelago:AddClearHandler("bonus rewards", function(slot_data)
        pools = BONUS_VANILLA
        if slot_data and type(slot_data.bonus_pools) == "table" then
            pools = {}
            for dungeon, entries in pairs(slot_data.bonus_pools) do
                pools[dungeon] = entries
            end
        end
        records = {}
        live = {}
        Archipelago:SetNotify({bonus_key(), live_key()})
        Archipelago:Get({bonus_key(), live_key()})
        BonusRefresh()
    end)
    Archipelago:AddRetrievedHandler("bonus rewards", on_records)
    Archipelago:AddSetReplyHandler("bonus rewards", function(key, value) on_records(key, value) end)
end

BonusRefresh()
