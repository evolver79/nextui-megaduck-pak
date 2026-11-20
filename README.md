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
./build-core.sh    # rebuilds the core in Docker; test it on a device before releasing
```

The core in `MEGADUCK.pak/` is built from SameDuck's source (SameBoy's `SameDuck` branch, commit `5619abd`) for 64-bit
ARM Linux, with one change: it outputs sound at 48 kHz instead of 384 kHz. At 384 kHz NextUI had to downsample 6,400
samples a frame, which kept a CPU core of the Brick maxed out and made games run slower than on the real console. At
48 kHz the core uses about two thirds of a CPU core and games run at full speed.

Pushing a tag `vX.Y.Z` that matches `version` in `pak.json` makes a GitHub release with the zip attached.

## Made with an AI assistant

This pak was built with the help of an LLM (Claude, by Anthropic): the scripts, configuration and documentation were
written in conversation with it, and tested on a real TrimUI Brick.

## License

The pak's own files are MIT ([LICENSE](LICENSE)). SameDuck is part of SameBoy by Lior Halphon, under the Expat license
([LICENSE-SameDuck](LICENSE-SameDuck)); the release zip includes it.
