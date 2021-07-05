#include <stdio.h>

unsigned int solve() {
  unsigned int x = 1, y = 2, ans = 0;
  while (x <= 4e6) {
    if (!(y % 2)) {
      ans += y;
    }
    y += x;
    x = y - x;
  }
  return ans;
}

int main() { printf("%d\n", solve()); }
