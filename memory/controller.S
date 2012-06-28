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
init:
  
  bl touchRegs
  bl initMemory
  bl initPointers
  bl setupTraps
  bl resetChanends
  //bl initThreads
  
  // Get tree, cb and leaf chanends
  getr  r0, XS1_RES_TYPE_CHANEND
  getr  r1, XS1_RES_TYPE_CHANEND
  getr  r2, XS1_RES_TYPE_CHANEND
  stw   r2, dp[leafChan]

  // Initialise pointers
  ldaw  r4, dp[data]
  ldw   r5, cp[leafStorage]

  // Setup event vectors on channels
  ldap r11, treeChanAccess
  setv res[r0], r11
  setc res[r0], XS1_SETC_IE_MODE_EVENT
  eeu  res[r0]
  ldap r11, cbChanAccess
  setv res[r1], r11
  setc res[r1], XS1_SETC_IE_MODE_EVENT
  eeu  res[r1]
  setsr XS1_SR_EEBLE_MASK
  
  // Synchronise with all remote leaves
  ldc   r10, LEAF_OFFSET+1
  ldc   r11, NUM_LEAVES+LEAF_OFFSET
syncLoop:
  eq    r9, r10, r11
  bt    r9, exitSyncLoop
  shl   r9, r10, 16
  ldc   r8, XS1_RES_TYPE_CHANEND 
  or    r8, r9, r8         // dest = dest<<16 | XS1_TYPE_CHANEND
  setd  res[r2], r8
  out   res[r2], r2
  outct res[r2], CT_END
  chkct res[r2], CT_END
  add   r10, r10, 1
  bu    syncLoop
exitSyncLoop:

  // r0: chanend tree
  // r1: chanend cb
  // r2: chanend leaf
  // r3: value
  // r4: data area pointer
  // r5: leaf storage
  // r6: destination
  // r7: request
  // r8: chanend current:
  // r9: address
  // r10: address offset
  // r11: scratch

initChans:
  // Initilise with the client tree channel
  ldc   r11, XS1_RES_TYPE_CHANEND
  setd  res[r0], r11
  outct res[r0], CT_END
  out   res[r0], r0
  
  // Initilise with the client cb channel
  ldc   r10, 0x100
  ldc   r11, XS1_RES_TYPE_CHANEND
  or    r11, r11, r10
  setd  res[r1], r11
  outct res[r1], CT_END
  out   res[r1], r1

loop:
  waiteu

// Setup address offsets and channel
treeChanAccess:
  mov r8, r0
  ldc r10, 0
  bu serviceAccess

cbChanAccess:
  mov r8, r1
  ldw r10, cp[treeSize]

// Service a memory access
serviceAccess:
  inct  r7, res[r8]
  eq    r11, r7, CT_READ
  bt    r11, read
  eq    r11, r7, CT_WRITE
  bt    r11, write
  bu    exit

read:
  in    r9, res[r8]         // c ? address
  add   r9, r9, r10          // address = address + offset
  divs  r6, r9, r5          // dest = address / leafStorage
  rems  r9, r9, r5          // address = address % leafStorage
  eq    r11, r6, 0
  bf    r11, remoteRead     // if dest == 0 then localwrite else remotewrite
  
localread:
  ldw   r11, r4[r9]
  out   res[r8], r11        // c ! data[address]
  bu    loop

remoteRead:
  // Calculate dest, address and dest channel ID
  add   r6, r6, LEAF_OFFSET // dest += LEAF_OFFSET
  shl   r6, r6, 16
  ldc   r11, XS1_RES_TYPE_CHANEND 
  or    r6, r6, r11         // r6 (dest) = dest<<16 | XS1_TYPE_CHANEND
 
  // Perform the write
  setd  res[r2], r6
  outct res[r2], CT_READ    // m ! CT_WRITE
  out   res[r2], r9         // m ! address
  in    r11, res[r2]        // m ? value
  outct res[r2], CT_END     // m ! CT_END
  chkct res[r2], CT_END     // m ? CT_END
  
  out   res[r8], r11        // c ! data[address]
  bu    loop

write:
  in    r9, res[r8]         // c ? address
  in    r3, res[r8]         // c ? value
  add   r9, r9, r10          // address = address + offset
  divs  r6, r9, r5          // dest = address / leafStorage
  rems  r9, r9, r5          // address = address % leafStorage
  eq    r11, r6, 0
  bf    r11, remoteWrite    // if dest == 0 then localwrite else remotewrite
 
localwrite:
  stw   r3, r4[r9]          // data[address] = value
  bu loop

remoteWrite:
  // Calculate dest, address and dest channel ID
  add   r6, r6, LEAF_OFFSET // dest += LEAF_OFFSET
  shl   r6, r6, 16
  ldc   r11, XS1_RES_TYPE_CHANEND 
  or    r6, r6, r11         // dest = (dest<<16) | XS1_TYPE_CHANEND
  // Perform the write
  setd  res[r2], r6
  outct res[r2], CT_WRITE   // m ! CT_WRITE
  out   res[r2], r9         // m ! address
  out   res[r2], r3         // m ! value
  outct res[r2], CT_END     // m ! CT_END
  bu loop

exit:
  // Halt all remote leaves
  ldc   r11, LEAF_OFFSET
  ldc   r10, NUM_LEAVES+LEAF_OFFSET-2
  ldw   r2, cp[leafChan]
haltLoop:
  eq    r9, r11, r10
  bt    r9, exitHaltLoop
  shl   r10, r11, 16
  ldc   r11, XS1_RES_TYPE_CHANEND 
  or    r10, r10, r11         // dest = dest<<16 | XS1_TYPE_CHANEND
  setd  res[r2], r10
  outct res[r2], CT_END
  add   r11, r11, 1
  bu    haltLoop
exitHaltLoop:

  ldc r0, 0
  bl _exit
  
.section .dp.data, "awd", @progbits
  .align BYTES_PER_WORD
  
  .globl sp, "ui"

sp:
  .space BYTES_PER_WORD
  .set sp.globound, BYTES_PER_WORD

leafChan:
  .space BYTES_PER_WORD
  .set leafChan.globound, BYTES_PER_WORD

treeSize:
  .word TREE_SIZE
  .set treeSize.globound, BYTES_PER_WORD

cbSize:
  .word CB_SIZE
  .set cbSize.globound, BYTES_PER_WORD

leafStorage:
  .word LEAF_STORAGE
  .set leafStorage.globound, BYTES_PER_WORD

data:
  .space 1000*BYTES_PER_WORD
  .globl data.globound
  .set data.globound, 1000*BYTES_PER_WORD

