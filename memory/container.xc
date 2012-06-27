#include <xs1.h>
#include <platform.h>

void foo(void) {}

int main(void) {
  par {
    on stdcore[0] : foo();
    on stdcore[1] : foo();
  }
  return 0;
}

