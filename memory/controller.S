#include <xs1.h>
  
  .extern touchRegs
  .extern initMemory
  .extern initPointers
  .extern setupTraps
  .extern resetChanends
  .extern initThreads
  
  .globl main
  .globl _start

  .text

  .align 2 

main:
_start:
  
  bl touchRegs
  bl initMemory
  bl initPointers
  bl setupTraps
  bl resetChanends
  bl initThreads
  
  // Initilise with the client
  getr r11, 2
  ldc  r10, 2
  setd res[r11], r10
  outct res[r11], 1
  out res[r11], r11

