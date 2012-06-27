#include "util.h"

extern unsigned stree[];

#pragma unsafe arrays
void memory(unsigned c) {
  int running;
  int request;
  unsigned address;
  unsigned data;
  running = 1;
  while (running) {
    INCT(c, request);
    switch(request) {
    case 3:
      IN(c, address);
      OUT(c, stree[address]);
      break;
    case 4:
      IN(c, address);
      IN(c, data);
      stree[address] = data;
      break;
    default:
      running = 0;
      break;
    }
  }
}
