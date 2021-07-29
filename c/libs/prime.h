#include "structs.h"
#include <stdint.h>
#ifndef PRIME_H
#define PRIME_H
struct SieveAndPrimes {
  vec primes;
  int8_t *sieve;
};
struct SieveAndPrimes main_helper(unsigned int);
struct SieveAndPrimes get_sieve_and_primes(unsigned int);
int8_t *make_sieve(unsigned int);
vec get_primes_upto(unsigned int);
unsigned int get_nth_prime(unsigned int);
#endif
