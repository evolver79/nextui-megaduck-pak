#!/bin/sh
# Updates the SameDuck libretro core (64-bit ARM Linux, libretro buildbot nightly) in MEGADUCK.pak/.
# The core is committed, so releases ship the build that was tested; run this only to move to a newer one,
# then test it on a device before tagging.
set -e
cd "$(dirname "$0")"
tmp=$(mktemp -d)
curl -fsSL -o "$tmp/core.zip" https://buildbot.libretro.com/nightly/linux/aarch64/latest/sameduck_libretro.so.zip
unzip -oq "$tmp/core.zip" -d "$tmp"
mv "$tmp/sameduck_libretro.so" MEGADUCK.pak/
rm -rf "$tmp"
file MEGADUCK.pak/sameduck_libretro.so
shasum -a 256 MEGADUCK.pak/sameduck_libretro.so
