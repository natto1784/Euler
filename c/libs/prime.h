#include "structs.h"
#include <stdint.h>
#ifndef PRIME_H
#define PRIME_H
struct SieveAndPrimes {
  vec primes;
  int8_t *sieve;
};
int8_t *make_sieve(unsigned int);
vec get_primes_upto(unsigned int);
struct SieveAndPrimes get_sieve_and_primes(unsigned int);
#endif
