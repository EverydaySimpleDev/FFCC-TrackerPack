# Final Fantasy Crystal Chronicles: Map Tracker

A PopTracker pack for the
[Final Fantasy Crystal Chronicles Randomizer](https://github.com/EverydaySimpleDev/Final-Fantasy-Crystal-Chronicles-Randomizer)
and its Archipelago world.

It has a map of every dungeon area with its chests, the town maps with their shops, the Moogle Nests with their
stamps, and item panels for stage keys, equipment, extra spell rings, dungeon cycles and Mog stamps.

## Variants

- **FFCC Multiworld:** for Archipelago seeds. Connect it to your room and it tracks on its own: checked locations,
  items received, the seed's options (stage keys, shuffled loading zones, Monster Hunt, shop checks and more) and the
  Moogle stamps you have.
- **FFCC Tracker:** marked by hand, for single-player randomizer ISOs.

## Installation

### PopTracker

1. Get [PopTracker](https://poptracker.github.io/).
2. Download the pack's
   [`.zip`](https://everydaysimpledev.github.io/FFCC-TrackerPack/ffcc_randomizer_everydaysimpledev.zip) and put it,
   still zipped, in PopTracker's `packs` folder.
3. Open PopTracker, load the pack and pick a variant. For FFCC Multiworld, click the AP button and enter your room's
   address and your slot name.

### Universal Tracker

The FFCC Archipelago client can show this pack's maps in a Map tab through
[Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker). The first time, it asks for the
pack: pick the `.zip` file itself, since an unzipped folder won't load. The Map tab turns to the dungeon you are in.
The AP world's setup guide has the details.

## Keeping it matched to the apworld

The pack's locations come from the AP world. After the world's locations change, regenerate them with
`py tools/gen_pack.py [path to worlds/ffcc]`, then bump the version in `manifest.json` and `repository.json`.
