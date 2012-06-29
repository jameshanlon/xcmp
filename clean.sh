#! /usr/bin/env bash

set -x

rm a.bin
rm a.elf
rm a.xe
rm dump
rm sim2
make clean
(cd elf; make clean)
