#!/bin/sh
# Builds the SameDuck libretro core into MEGADUCK.pak/, for 64-bit ARM Linux (glibc 2.31, Debian bullseye in Docker).
# One change from upstream: the core outputs sound at 48 kHz instead of 384 kHz. At 384 kHz NextUI has to downsample
# 6,400 samples a frame, which kept the Brick's CPU core maxed out and made games run slow.
# The core is committed, so releases ship the build that was tested; test a rebuild on a device before tagging.
set -e
cd "$(dirname "$0")"
COMMIT=5619abdb01cee6bedb47599cdb5532c318443b52   # SameBoy's SameDuck branch, 10 Dec 2023
tmp=$(mktemp -d)
git clone -q -b SameDuck https://github.com/LIJI32/SameBoy.git "$tmp/src"
git -C "$tmp/src" checkout -q "$COMMIT"
sed -i.bak 's/^#define AUDIO_FREQUENCY 384000/#define AUDIO_FREQUENCY 48000/' "$tmp/src/libretro/libretro.c"
grep -q '^#define AUDIO_FREQUENCY 48000' "$tmp/src/libretro/libretro.c"
docker run --rm --platform linux/arm64 -v "$tmp/src:/w" -w /w debian:bullseye sh -c \
  'printf "%s\n" "deb http://archive.debian.org/debian bullseye main" \
     "deb http://archive.debian.org/debian-security bullseye-security main" > /etc/apt/sources.list &&
   apt-get -qq -o Acquire::Check-Valid-Until=false update && apt-get install -y -qq --no-install-recommends gcc libc6-dev make git >/dev/null && git config --global --add safe.directory "*" &&
   make libretro -j4 CONF=release >/dev/null'
cp "$tmp/src/build/bin/sameduck_libretro.so" MEGADUCK.pak/
rm -rf "$tmp"
file MEGADUCK.pak/sameduck_libretro.so
shasum -a 256 MEGADUCK.pak/sameduck_libretro.so
