#include <stdio.h>

typedef unsigned long long ull;

ull solve(ull n) {
  // 0<a<b<c<n, a+b+c = n so a+a+a < n => 3a<n
  ull a = 1, b = 2, c = 3;
  for (a = n / 3 - 1; a > 0; a--) {
    b = (n * (n - 2 * a)) / (2 * (n - a));
    c = n - a - b;
    if (c * c == a * a + b * b && b > a)
      break;
  }
  return a * b * c;
}

int main() { printf("%lld\n", solve(1000)); }
