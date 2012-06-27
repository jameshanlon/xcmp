#include "defs.h"

  .globl sp, "ui"

.section .dp.data, "awd", @progbits
  .align BYTES_PER_WORD

sp:
  .space BYTES_PER_WORD
  .set sp.globound, BYTES_PER_WORD

