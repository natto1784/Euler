#include "prime.h"
#include "structs.h"
#include <math.h>
#include <stdint.h>
#include <stdlib.h>

struct SieveAndPrimes main_helper(unsigned int N) {
  int8_t *sieve = (int8_t *)calloc(sizeof(int8_t), N + 1);
  vec primes;
  new_vec(&primes);
  for (unsigned int x = 2; x <= sqrt(N); x++) {
    if (!sieve[x]) {
      for (unsigned int y = x * x; y <= N; y += x)
        sieve[y] = 1;
      vec_push_back(&primes, x);
    }
  }
  struct SieveAndPrimes ret = {primes, sieve};
  return ret;
};

struct SieveAndPrimes get_sieve_and_primes(unsigned int N) {
  struct SieveAndPrimes a = main_helper(N);
  for (unsigned int x = ceil(sqrt(N)); x <= N; x++) {
    if (!a.sieve[x]) {
      vec_push_back(&a.primes, x);
    }
  }
  return a;
}

int8_t *make_sieve(unsigned int N) {
  struct SieveAndPrimes a = main_helper(N);
  vec_free(&a.primes);
  return a.sieve;
}

vec get_primes_upto(unsigned int N) {
  struct SieveAndPrimes a = get_sieve_and_primes(N);
  free(a.sieve);
  return a.primes;
}

unsigned int get_nth_prime(unsigned int n) {
  double ub = n * log(n * log(n));
  return get_primes_upto(ceil(ub)).items[n - 1];
}
