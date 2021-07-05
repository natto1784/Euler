#include <stdio.h>

unsigned int sum_of_multiples_below_1000(unsigned short x) {
  unsigned int g = 0;
  for (int i = x; i < 1000; g += i, i += x)
    ;
  return g;
}

int main() {
  printf("%d\n", sum_of_multiples_below_1000(5) +
                     sum_of_multiples_below_1000(3) -
                     sum_of_multiples_below_1000(15));
}
