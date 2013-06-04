#! /bin/bash

txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
txtred=$(tput setaf 1)          # red
txtorg=$(tput setaf 3)          # orange
txtblu=$(tput setaf 4)          # blue
txtwht=$(tput setaf 7)          # white
bldred=${txtbld}$(tput setaf 1) # red
bldblu=${txtbld}$(tput setaf 4) # blue
bldwht=${txtbld}$(tput setaf 7) # white
txtrst=$(tput sgr0)             # Reset

#set -x
set -e # quit on errors
echo "" > log.txt

export XCC_DEVICE_PATH=`pwd`/configs

# For each network type
for t in clos mesh; do
  # For each memory type
  for m in SRAM eDRAM; do
    #for n in 512 1024 2048 4096; do
    for n in 512; do
      echo $txtred "$t, $m, $n tiles" $txtrst
      echo "$n cores" >> log.txt

      echo "  creating memory images"
      make -C memory clean >> log.txt 
      make -C memory NUM_CORES=$n >> log.txt
      
      echo -ne "  building XE "
      python xebuilder.py $n cmp.elf memory/core1.elf memory/core2.elf
      echo "($(($(stat -c%s "a.xe")/1024)) KiB)"
      
      echo "  running simulation"
      echo -ne $txtorg
      axe a.xe -S -c configs/$t-$n-$m.cfg < ecmps1.x >> /dev/null 
      echo "  output $(($(stat -c%s "axe1")/1024)) KiB"
      echo -ne $txtrst
      
    done
  done
done

