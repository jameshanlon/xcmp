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

#set -x
echo "" > log.txt

# For each memory type
#for n in 64 128 256 512 1024; do
for n in 8 16 32 64 128 256; do
  echo -ne $txtred
  echo "$n cores"
  echo -ne $txtrst
  echo "$n cores" >> log.txt

  echo "  Building distributed memory"
  (cd memory; make clean >> log.txt && \
    make NUM_CORES=$n CORES_PER_NODE=$n >> log.txt) 
  echo "  Building compiler"
  bash build.sh &>> log.txt
  echo "  Running simulation"
  echo -ne $txtorg
  axe a.xe -S -c configs/$n-2dmesh.cfg < ecmps1.x 
  echo -ne $txtrst
  
done

