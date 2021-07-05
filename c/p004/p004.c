#include <math.h>
#include <stdint.h>
#include <stdio.h>

int8_t is_palindrome(uint32_t x) {
  uint32_t a = x, y = 0;
  while (x) {
    y *= 10;
    y += x % 10;
    x /= 10;
  }
  return a == y;
}

uint32_t solve(uint8_t n) {
  uint16_t y = pow(10, n) - 1, x = pow(10, n - 1);
  uint32_t ans = 0;
  for (uint16_t i = y; i >= x; i--)
    for (uint16_t j = i; j >= x; j--) {
      uint32_t z = i * j;
      if (is_palindrome(z) && z > ans)
        ans = z;
    }
  return ans;
}

int main() { printf("%d\n", solve(3)); }
