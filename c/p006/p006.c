#include <stdio.h>

typedef unsigned long long ull;

ull solve(ull n) {
  ull s = (n * (n + 1)) / 2, S = (n * (n + 1) * (2 * n + 1)) / 6;
  return (s * s) - S;
}

int main() { printf("%lld\n", solve(100)); }
