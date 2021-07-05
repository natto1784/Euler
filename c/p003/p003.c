#include <math.h>
#include <stdio.h>

unsigned long solve(unsigned long x) {
  unsigned long a = 0;
  while (!(x % 2)) {
    a = 2;
    x /= 2;
  }
  for (unsigned long z = 3; z <= sqrt(x); z++) {
    if (!(x % z)) {
      a = z;
      x /= z;
    }
  }
  return (x == 1 ? a : x);
}

int main() { printf("%ld\n", solve(600851475143)); }
