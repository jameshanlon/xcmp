#! /usr/bin/env bash

set -x

# Bootstrap the compiler (>sim2)
cp ecmps.bin a.bin && ./xfastsim < ecmps.x && cp sim2 a.bin && ./xfastsim < ecmps.x

# Wrap compiler binary in an ELF (>a.elf)
./elf/elf sim2

# Replace in xe file
xobjdump -r 0,0,a.elf a.xe

if [[ $* == *-run* ]]; then
  axe a.xe < ecmps.x > dump
fi

