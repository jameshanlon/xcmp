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
  
  // r0: chanend request
  // r1: request
  // r2: address
  // r3: data
  // r4: data area pointer
  // r5: leaf storage
  // r6: destination
  // r7: chanend memory
  // r11: scratch
  
  // Initilise with the client
  getr  r0, XS1_RES_TYPE_CHANEND
  ldc   r11, XS1_RES_TYPE_CHANEND
  setd  res[r0], r11
  outct res[r0], CT_END
  out   res[r0], r0
  
  ldaw  r4, dp[data]
  ldw   r5, cp[leafStorage]
  getr  r7, XS1_RES_TYPE_CHANEND

  //mov r0, r11
  //bl  controller

loop:
  inct  r1, res[r0]
  eq    r11, r1, CT_READ
  bt    r11, read
  eq    r11, r1, CT_WRITE
  bt    r11, write
  bu    exit

read:
  in    r2, res[r0]         // c ? address
  
  // Calculate dest, address and dest channel ID
  divs  r6, r2, r5          // dest = address/leafStorage
  add   r6, r6, LEAF_OFFSET // dest += LEAF_OFFSET
  rems  r2, r2, r5          // address = address % leafStorage
  shl   r6, r6, 16
  ldc   r11, XS1_RES_TYPE_CHANEND 
  or    r6, r6, r11         // r6 (dest) = dest<<16 | XS1_TYPE_CHANEND
 
  // Perform the write
  setd  res[r7], r6
  outct res[r7], CT_READ    // m ! CT_WRITE
  out   res[r7], r2         // m ! address
  in    r11, res[r7]        // m ? value
  outct res[r7], CT_END     // m ! CT_END
  chkct res[r7], CT_END     // m ? CT_END
  //ldw r11, r4[r2]

  out   res[r0], r11        // c ! data[address]
  bu    loop

write:
  in    r2, res[r0]         // c ? address
  in    r3, res[r0]         // c ? value
  
  // Calculate dest, address and dest channel ID
  divs  r6, r2, r5          // dest = address/leafStorage
  add   r6, r6, LEAF_OFFSET // dest += LEAF_OFFSET
  rems  r2, r2, r5          // address = address % leafStorage
  shl   r6, r6, 16
  ldc   r11, XS1_RES_TYPE_CHANEND 
  or    r6, r6, r11         // r6 (dest) = dest<<16 | XS1_TYPE_CHANEND
 
  // Perform the write
  setd  res[r7], r6
  outct res[r7], CT_WRITE   // m ! CT_WRITE
  out   res[r7], r2         // m ! address
  out   res[r7], r3         // m ! value
  outct res[r7], CT_END     // m ! CT_END
  //stw r3, r4[r2]          // data[address] = value

  bu loop

exit:
  
  // Halt all leaves
  ldc r11, 1
  ldc r10, NUM_LEAVES
haltloop:
  eq  r9, r11, r10
  bt  r9, exithaltloop
  add   r10, r11, LEAF_OFFSET // dest += LEAF_OFFSET
  shl   r10, r10, 16
  ldc   r11, XS1_RES_TYPE_CHANEND 
  or    r10, r10, r11         // dest = dest<<16 | XS1_TYPE_CHANEND
  setd  res[r7], r10
  outct res[r7], CT_END
  add   r11, r11, 1
  bu haltloop
exithaltloop:

  ldc r0, 0
  bl _exit

.section .dp.data, "awd", @progbits
  .align BYTES_PER_WORD
  
  .globl sp, "ui"

sp:
  .space BYTES_PER_WORD
  .set sp.globound, BYTES_PER_WORD

leafStorage:
  .word LEAF_STORAGE
  .set leafStorage.globound, BYTES_PER_WORD

data:
  .space 1000*BYTES_PER_WORD
  .globl data.globound
  .set data.globound, 1000*BYTES_PER_WORD

