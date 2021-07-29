#include "../libs/prime.h"
#include <stdio.h>
unsigned long long solve(int x) {
  vec primes = get_primes_upto(x - 1);
  unsigned long long ans = 0;
  for (int i = 0; i < primes.total; i++)
    ans += primes.items[i];
  return ans;
}

int main() { printf("%lld\n", solve(2e6)); }
