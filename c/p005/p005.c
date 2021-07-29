#include "../libs/prime.h"
#include <stdio.h>

int solve(int x) {
  if (x == 1)
    return 2;
  vec primes = get_primes_upto(x);
  int ans = 1;
  for (int g = 0; g < primes.capacity; g++) {
    int h = primes.items[g];
    while (h * primes.items[g] <= x)
      h *= primes.items[g];
    ans *= h;
  }
  vec_free(&primes);
  return ans;
}

int main() { printf("%d\n", solve(20)); }
