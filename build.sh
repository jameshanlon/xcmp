#! /usr/bin/env bash

set -x

# Bootstrap the compiler (>sim2)
cp ecmps.bin a.bin && ./xfastsim < ecmps.x && cp sim2 a.bin && ./xfastsim < ecmps.x

# Wrap compiler binary in an ELF (>a.elf)
./elf/elf sim2

# Create an XE file if it doesn't exist
if [ ! -f a.xe ]; then
  echo "#include <xs1.h>" > main.xc
  echo "int main(void) { return 0; }" >> main.xc
  xcc -target=XK-1 main.xc -o a.xe
fi

# Replace in xe file
xobjdump -r 0,0,a.elf a.xe

if [[ $* == *-run* ]]; then
  axe a.xe < ecmps.x > dump
  echo "dumped $(stat -c%s "dump")KB"
fi

