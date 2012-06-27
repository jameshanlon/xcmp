#include <xs1.h>
#include "defs.h"
  
  .globl touchRegs
  .globl initPointers
  .globl setupTraps
  .globl initThread

/*============================================================
 * Exception/interrupt handler (KEP) 
 * NOTE: THIS MUST BE LINKED AT THE BEGINNING OF THE BINARY.
 *============================================================*/
  .cc_top exepHandler.function, exepHandler

  /* Force the KEP to align on byte 64 */
  //nop
  .align 128
exepHandler:

  clre
  waiteu

  .cc_bottom exepHandler.function
 
/*===========================================================
 * Touch registers
 *===========================================================*/
  .cc_top touchRegs.function, touchRegs
  .align 2
touchRegs:
  ldc r0,  0
  ldc r1,  0
  ldc r2,  0
  ldc r3,  0
  ldc r4,  0
  ldc r5,  0
  ldc r6,  0
  ldc r7,  0
  ldc r8,  0
  ldc r9,  0
  ldc r10, 0
  retsp 0
  .cc_bottom touchRegs.function

/*============================================================================
 * Init pointers: cp, dp, ksp, sp
 * Written in assembly to ensure no use is made of the stack 
 * before sp has been properly set
 *==========================================================================*/
  .cc_top initPointers.function, initPointers
  .align 2
initPointers:

  /* Set cp, dp */
  ldap r11, _cp
  set cp, r11
  ldap r11, _dp
  set dp, r11

  /* Get PS_RAM_BASE and set PS_VEC_BASE */
  ldc r11, 0xb
  ldc r10, 0x10b
  get r9, ps[r11]
  set ps[r10], r9

  /* ksp = 2*PS_RAM_BASE-BYTES_PER_WORD */
  shl r11, r9, 1
  sub r11, r11, 8
  set sp, r11
  stw r11, sp[0]
  krestsp 0

  /* sp = ksp - KERNEL_SPACE */
  ldc r10, KERNEL_SPACE
  sub r11, r11, r10
  set sp, r11

  /* Save the sp for thread allocation */
  stw r11, dp[sp]

  retsp 0
  .cc_bottom initPointers.function

/*===========================================================
 * Initialise kep for exceptions
 *===========================================================*/
  .cc_top setupTraps.function, setupTraps
  .align 2
setupTraps:
  ldap r11, exepHandler
  set kep, r11
  retsp 0
  .cc_bottom setupTraps.function

/*============================================================================
 * Init thread. Written in assembly to ensure registers are preserved 
 * properly. Gets called per thread both with asynchronous thread creation by 
 * hosting mechanism and by synchronous thread creation with fork-join 
 * concurrent composition.
 *==========================================================================*/
  .cc_top initThread.function, initThread
  .align 2
initThread:
  bl touchRegs
  bl setupTraps
  ssync
  .cc_bottom initThread.function

