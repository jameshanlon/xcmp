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
  
  // Initialise pointers
  ldaw  r4, dp[data]
  ldw   r5, dp[leafStorage]

  // Get tree, codebuffer, labval and leaf chanends
  // Setup event vectors on channels
  getr r0, XS1_RES_TYPE_CHANEND
  ldap r11, treeChanAccess
  setv res[r0], r11
  setc res[r0], XS1_SETC_IE_MODE_EVENT
  eeu  res[r0]
  getr  r1, XS1_RES_TYPE_CHANEND
  ldap r11, labvalChanAccess
  setv res[r1], r11
  setc res[r1], XS1_SETC_IE_MODE_EVENT
  eeu  res[r1]
  getr  r2, XS1_RES_TYPE_CHANEND
  ldap r11, codebufferChanAccess
  setv res[r2], r11
  setc res[r2], XS1_SETC_IE_MODE_EVENT
  eeu  res[r2]
  setsr XS1_SR_EEBLE_MASK
 
  // Get a chanend to talk to leaves
  getr  r3, XS1_RES_TYPE_CHANEND
  stw   r3, dp[leafChan]

  // Synchronise with all remote leaves
  // r10: leaf location
  // r11: max leaf location
  ldc   r10, LEAF_OFFSET+1
  ldc   r11, NUM_LEAVES+LEAF_OFFSET
syncLoop:
  eq    r9, r10, r11
  bt    r9, exitSyncLoop
#if defined(XS1_L)
  shl   r9, r10, 16
  ldc   r8, XS1_RES_TYPE_CHANEND 
  or    r8, r9, r8         // dest = dest<<16 | XS1_TYPE_CHANEND
#elif defined(XS1_G)
  ldc   r8, CORES_PER_NODE
  rems  r9, r10, r8         
  shl   r9, r9, 16        // core = (dest%CORES_PER_NODE)<<16
  divs  r7, r10, r8         
  bitrev r7, r7           // node = bitrev(dest/CORES_PER_NODE)
  ldc   r8, XS1_RES_TYPE_CHANEND 
  or    r8, r9, r8         
  or    r8, r7, r8         // dest = node | core | XS1_TYPE_CHANEND
#endif
  setd  res[r3], r8
  out   res[r3], r3
  outct res[r3], CT_END
  chkct res[r3], CT_END
  add   r10, r10, 1
  bu    syncLoop
exitSyncLoop:

  // r0: chanend tree
  // r1: chanend codebuffer
  // r2: chanend labval
  // r3: chanend leaf
  // r4: data area pointer
  // r5: leaf storage
  // r6: destination
  // r7: request
  // r8: chanend current
  // r9: address
  // r10: address offset current
  // r11: scratch

initChans:
  // Initilise with the client tree channel
  ldc   r11, XS1_RES_TYPE_CHANEND
  setd  res[r0], r11
  outct res[r0], CT_END
  out   res[r0], r0
  outct res[r0], CT_END
  chkct res[r0], CT_END
  
  // Initilise with the client labval channel
  ldc   r10, 0x100
  ldc   r11, XS1_RES_TYPE_CHANEND
  or    r11, r11, r10
  setd  res[r1], r11
  outct res[r1], CT_END
  out   res[r1], r1
  outct res[r1], CT_END
  chkct res[r1], CT_END

  // Initilise with the client codebuffer channel
  ldc   r10, 0x200
  ldc   r11, XS1_RES_TYPE_CHANEND
  or    r11, r11, r10
  setd  res[r2], r11
  outct res[r2], CT_END
  out   res[r2], r2
  outct res[r2], CT_END
  chkct res[r2], CT_END

loop:
  waiteu

// Setup address offsets and channel
treeChanAccess:
  mov r8, r0
  ldc r10, 0
  ldw r11, dp[treeSize]
  stw r11, dp[currentSize]
  bu serviceAccess

labvalChanAccess:
  mov r8, r1
  ldw r10, dp[labvalOffset]
  ldw r11, dp[labvalSize]
  stw r11, dp[currentSize]
  bu serviceAccess

codebufferChanAccess:
  mov r8, r2
  ldw r10, dp[codebufferOffset]
  ldw r11, dp[codebufferSize]
  stw r11, dp[currentSize]
  bu serviceAccess

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
  /*ldw   r11, dp[currentSize]
  lss   r11, r9, r11
  ecallf r11*/
  add   r9, r9, r10         // address = address + offset
  divs  r6, r9, r5          // dest = address / leafStorage
  rems  r9, r9, r5          // address = address % leafStorage
  eq    r11, r6, 0
  bf    r11, remoteRead     // if dest == 0 then localwrite else remotewrite
  
localRead:
  ldw   r11, r4[r9]
  out   res[r8], r11        // c ! data[address]
  bu    loop

remoteRead:
  // Calculate dest, address and dest channel ID
  add   r6, r6, LEAF_OFFSET // dest += LEAF_OFFSET
#if defined(XS1_L)
  shl   r6, r6, 16          // core = dest<<16
  ldc   r11, XS1_RES_TYPE_CHANEND 
  or    r6, r6, r11         // dest = core | XS1_TYPE_CHANEND
#elif defined(XS1_G)
  ldc   r10, CORES_PER_NODE
  rems  r11, r6, r10         
  shl   r11, r11, 16        // core = (dest%CORES_PER_NODE)<<16
  divs  r10, r6, r10         
  bitrev r10, r10           // node = bitrev(dest/CORES_PER_NODE)
  ldc   r6, XS1_RES_TYPE_CHANEND 
  or    r6, r10, r6         
  or    r6, r11, r6         // dest = node | core | XS1_TYPE_CHANEND
#endif
 
  // Perform the read
  setd  res[r3], r6
  outct res[r3], CT_READ    // m ! CT_WRITE
  out   res[r3], r9         // m ! address
  in    r11, res[r3]        // m ? value
  outct res[r3], CT_END     // m ! CT_END
  chkct res[r3], CT_END     // m ? CT_END
  
  out   res[r8], r11        // c ! data[address]
  bu    loop

write:
  in    r9, res[r8]         // c ? address
  in    r7, res[r8]         // c ? value (r7)
  /*ldw   r11, dp[currentSize]
  lss   r11, r9, r11
  ecallf r11*/
  add   r9, r9, r10         // address = address + offset
  divs  r6, r9, r5          // dest = address / leafStorage
  rems  r9, r9, r5          // address = address % leafStorage
  eq    r11, r6, 0
  bf    r11, remoteWrite    // if dest == 0 then localwrite else remotewrite
 
localWrite:
  stw   r7, r4[r9]          // data[address] = value
  outct res[r8], CT_END     // c ! CT_END
  bu    loop

remoteWrite:
  // Calculate dest, address and dest channel ID
  add   r6, r6, LEAF_OFFSET // dest += LEAF_OFFSET
#if defined(XS1_L)
  shl   r6, r6, 16          // core = dest<<16
  ldc   r11, XS1_RES_TYPE_CHANEND 
  or    r6, r6, r11         // dest = core | XS1_TYPE_CHANEND
#elif defined(XS1_G)
  ldc   r10, CORES_PER_NODE
  rems  r11, r6, r10         
  shl   r11, r11, 16        // core = (dest%CORES_PER_NODE)<<16
  divs  r10, r6, r10 
  bitrev r10, r10           // node = bitrev(dest/CORES_PER_NODE)
  ldc   r6, XS1_RES_TYPE_CHANEND 
  or    r6, r10, r6
  or    r6, r11, r6         // dest = node | core | XS1_TYPE_CHANEND
#endif
  // Perform the write
  setd  res[r3], r6
  outct res[r3], CT_WRITE   // m ! CT_WRITE
  out   res[r3], r9         // m ! address
  out   res[r3], r7         // m ! value
  outct res[r3], CT_END     // m ! CT_END
  
  outct res[r8], CT_END     // c ! CT_END
  bu loop

exit:
  // Halt all remote leaves
  ldc   r10, LEAF_OFFSET+1
  ldc   r11, NUM_LEAVES+LEAF_OFFSET
  ldw   r3, dp[leafChan]
haltLoop:
  eq    r9, r10, r11
  bt    r9, exitHaltLoop
#if defined(XS1_L)
  shl   r9, r10, 16
  ldc   r8, XS1_RES_TYPE_CHANEND 
  or    r8, r9, r8         // dest = dest<<16 | XS1_TYPE_CHANEND
#elif defined(XS1_G)
  ldc   r8, CORES_PER_NODE
  rems  r9, r10, r8         
  shl   r9, r9, 16        // core = (dest%CORES_PER_NODE)<<16
  divs  r7, r10, r8         
  bitrev r7, r7           // node = bitrev(dest/CORES_PER_NODE)
  ldc   r8, XS1_RES_TYPE_CHANEND 
  or    r8, r9, r8         
  or    r8, r7, r8         // dest = node | core | XS1_TYPE_CHANEND
#endif
  setd  res[r3], r8
  outct res[r3], CT_END
  add   r10, r10, 1
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

labvalSize:
  .word LABVAL_SIZE
  .set labvalSize.globound, BYTES_PER_WORD

codebufferSize:
  .word CODEBUFFER_SIZE
  .set codebufferSize.globound, BYTES_PER_WORD

treeOffset:
  .word 0
  .set treeOffset.globound, BYTES_PER_WORD

labvalOffset:
  .word TREE_SIZE
  .set labvalOffset.globound, BYTES_PER_WORD

codebufferOffset:
  .word TREE_SIZE+LABVAL_SIZE
  .set codebufferOffset.globound, BYTES_PER_WORD

leafStorage:
  .word LEAF_STORAGE
  .set leafStorage.globound, BYTES_PER_WORD

totalStorage:
  .word TOTAL_STORAGE
  .set totalStorage.globound, BYTES_PER_WORD

currentSize:
  .word 0
  .set currentSize.globound, BYTES_PER_WORD

data:
  .space LEAF_STORAGE*BYTES_PER_WORD
  .globl data.globound
  .set data.globound, LEAF_STORAGE*BYTES_PER_WORD

/*data:
  .space 100*BYTES_PER_WORD
  .globl data.globound
  .set data.globound, 100*BYTES_PER_WORD*/

