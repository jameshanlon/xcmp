#include <xs1.h>
#include "defs.h"
  
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
  //bl initThreads
  
  // r0: chanend
  // r1: request
  // r2: address
  // r3: data
  // r4: data area pointer
  // r11: scratch

  //waiteu

  getr r0, 2 // This must be channel end 0
  ldaw r4, dp[data]

  // Synchronise with the controller
  in    r11, res[r0]
  setd  res[r0], r11
  chkct res[r0], CT_END
  outct res[r0], CT_END

loop:
  inct  r1, res[r0]
  eq    r11, r1, CT_READ
  bt    r11, read
  eq    r11, r1, CT_WRITE
  bt    r11, write
  bu    exit

read:
  in    r2, res[r0]
  ldw   r11, r4[r2]
  out   res[r0], r11
  chkct res[r0], CT_END
  outct res[r0], CT_END
  bu    loop

write:
  in    r2, res[r0]
  in    r3, res[r0]
  chkct res[r0], CT_END
  stw   r3, r4[r2]
  outct res[r0], CT_END
  bu    loop

exit:  
  //ldc   r0, 0
  //bl    _exit
  waiteu

.section .dp.data, "awd", @progbits
  .align BYTES_PER_WORD
  
  .globl sp, "ui"

sp:
  .space BYTES_PER_WORD
  .set sp.globound, BYTES_PER_WORD

data:
  .space LEAF_STORAGE*BYTES_PER_WORD
  .globl data.globound
  .set data.globound, LEAF_STORAGE*BYTES_PER_WORD

