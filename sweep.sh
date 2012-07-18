#! /bin/bash

txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
txtred=$(tput setaf 1)          # red
txtblu=$(tput setaf 4)          # blue
txtwht=$(tput setaf 7)          # white
bldred=${txtbld}$(tput setaf 1) # red
bldblu=${txtbld}$(tput setaf 4) # blue
bldwht=${txtbld}$(tput setaf 7) # white
txtrst=$(tput sgr0)             # Reset

#set -x
echo "" > log.txt

# For each memory type
for n in 64 128 256 512 1024; do
  echo -ne $txtblu
  echo "$n cores"
  echo -ne $txtrst
  echo "$n cores" >> log.txt

  (cd memory; make clean >> log.txt && \
    make NUM_CORES=$n CORES_PER_NODE=$n >> log.txt) 
  bash build.sh &>> log.txt
  axe a.xe -S -c configs/pm-$n.cfg
  
  #echo -ne $txtwht
  #echo -ne $txtred
  #echo -ne $txtblu
  #echo -ne $txtrst

done

