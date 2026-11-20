#!/bin/sh
# Builds dist/MEGADUCK.pak.zip with the pak's files at the top of the zip (the layout Pak Store expects).
# For a manual install, unzip it into a new folder: SD card Emus/tg5040/MEGADUCK.pak/.
set -e
cd "$(dirname "$0")"
[ -f MEGADUCK.pak/sameduck_libretro.so ] || ./build-core.sh
cp LICENSE-SameDuck MEGADUCK.pak/
mkdir -p dist
rm -f dist/MEGADUCK.pak.zip
(cd MEGADUCK.pak && zip -q -X ../dist/MEGADUCK.pak.zip launch.sh default.cfg sameduck_libretro.so LICENSE-SameDuck)
rm MEGADUCK.pak/LICENSE-SameDuck
unzip -l dist/MEGADUCK.pak.zip
