# Mega Duck pak for NextUI

Adds the Mega Duck / Cougar Boy (Welback, 1993) to [NextUI](https://github.com/LoveRetro/NextUI), using the libretro
[SameDuck](https://github.com/LIJI32/SameBoy/tree/SameDuck) core. No BIOS needed.

Tested on the TrimUI Brick (`tg5040`).

## Install

**Pak Store:** look for Mega Duck under Emulators.

**By hand:** download `MEGADUCK.pak.zip` from [Releases](../../releases) and unzip it into a new folder on the SD card,
`Emus/tg5040/MEGADUCK.pak/`.

## Games

Put games in `Roms/Mega Duck (MEGADUCK)/`. The folder name can be anything, but the tag in brackets must be `MEGADUCK`.
Both `.bin` (No-Intro) and `.duck` (homebrew) files work. Saves go to `Saves/MEGADUCK/`.

Free homebrew to try: [Mega Duck homebrew ROMs on itch.io](https://itch.io/c/2884652/mega-duck-console-homebrew-roms).

## Controls

Same as the Game Boy: D-pad, A, B, Select, Start. Change them in the in-game menu.

## Building

```sh
./package.sh       # writes dist/MEGADUCK.pak.zip
./fetch-core.sh    # only to move to a newer core build; test it on a device before releasing
```

The core in `MEGADUCK.pak/` is the libretro buildbot's 64-bit ARM Linux nightly from 13 Nov 2026 (needs glibc 2.29+).

Pushing a tag `vX.Y.Z` that matches `version` in `pak.json` makes a GitHub release with the zip attached.

## License

The pak's own files are MIT ([LICENSE](LICENSE)). SameDuck is part of SameBoy by Lior Halphon, under the Expat license
([LICENSE-SameDuck](LICENSE-SameDuck)); the release zip includes it.
