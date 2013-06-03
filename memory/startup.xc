#include "defs.h"
#include "util.h"

/*
 * Initialise memory: zero-initialise .bss section
 */
void initMemory() {
  unsigned begin;
  unsigned end;
  int size;

  asm("ldap r11, " LABEL_BEGIN_BSS
    "\n\tmov %0, r11" : "=r"(begin) :: "r11");
  asm("ldap r11, " LABEL_END_BSS
    "\n\tmov %0, r11" : "=r"(end) :: "r11");
  size = (end - begin) / BYTES_PER_WORD;

  for (int i=0; i<size; i++)
    asm("stw %0, %1[%2]" :: "r"(0), "r"(begin), "r"(i));
}

/* 
 * Allocate all remaining channel ends then free them to ensure they are all
 * available.
 */
void resetChanends() {
  unsigned c0;
  unsigned c;
  asm("getr %0, " S(XS1_RES_TYPE_CHANEND) : "=r"(c0));
  
  // Get all remaining channels
  do {
    asm volatile("getr %0, " S(XS1_RES_TYPE_CHANEND) : "=r"(c));
  } while(c);
   
  // Free all channels
  c = c0 & 0xFFFF00FF;
  for(int i=0; i<MAX_CHANNELS; i++) {
    FREER(c);
    c += 0x100;
  }
}

/*
 * Initialise all threads with: dp, cp, sp, zero-valued registers and TRAP
 * handler (kep).
 */
void initThreads() {
  unsigned sync;
  unsigned t;
  unsigned sp;
  GETR_SYNC(sync);
  asm("getst %0, res[%1]" : "=r"(t) : "r"(sync));
  while (t) {
    THREAD_SP(TID_MASK(t), sp);
    asm("init t[%0]:sp, %1"::"r"(t), "r"(sp));
    asm("ldaw r11, dp[0]; init t[%0]:dp, r11" :: "r"(t) : "r11");
    asm("ldaw r11, cp[0]; init t[%0]:cp, r11" :: "r"(t) : "r11");
    asm("ldap r11, initThread; init t[%0]:pc, r11" :: "r"(t) : "r11");
    asm("getst %0, res[%1]" : "=r"(t) : "r"(sync));
  }
  asm("msync res[%0]" :: "r"(sync));
  asm("mjoin res[%0]" :: "r"(sync));
  FREER(sync);
}

