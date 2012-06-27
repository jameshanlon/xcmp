#include "defs.h"

  .globl sp,    "ui"
  .globl stree, "a(:ui)"

.section .dp.data, "awd", @progbits
  .align BYTES_PER_WORD

sp:
  .space BYTES_PER_WORD
  .set sp.globound, BYTES_PER_WORD

stree:
  .space 1000*BYTES_PER_WORD
  .globl stree.globound
  .set stree.globound, 1000*BYTES_PER_WORD

