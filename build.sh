#! /usr/bin/env bash

set -x

# Bootstrap the compiler (>sim2)
cp ecmps.bin a.bin && \
  ./xfastsim < ecmps.x && \
   cp sim2 a.bin && \
  #./xfastsim < test.x
  ./xfastsim < ecmps-distributed.x

# Wrap compiler binary in an ELF (>a.elf)
./elf/elf sim2

# Create an XE file if it doesn't exist
if [ memory/a.xe -nt a.xe ]; then
  cp memory/a.xe ./a.xe
#  (cd memory && make)
fi

# Replace in xe file
xobjdump -r 0,0,a.elf a.xe

if [[ $* == *-run* ]]; then
  axe a.xe < ecmps.x > dump
  echo "dumped $(stat -c%s "dump")KB"
fi

