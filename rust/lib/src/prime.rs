use std::intrinsics::{ceilf32, logf32};

fn main_helper(n: usize) -> (Vec<u32>, Vec<bool>) {
    let mut sieve: Vec<bool> = Vec::with_capacity(n + 1);
    let mut primes: Vec<u32> = Vec::new();
    for _ in 0..=n {
        sieve.push(true);
    }
    for x in 2..=((n as f64).sqrt() as usize) {
        if sieve[x] {
            for y in (x * x..=n).step_by(x) {
                sieve[y] = false;
            }
            primes.push(x as u32);
        }
    }
    (primes, sieve)
}

pub fn make_sieve(n: usize) -> Vec<bool> {
    let (_, sieve) = main_helper(n);
    sieve
}

pub fn get_sieve_and_primes(n: usize) -> (Vec<u32>, Vec<bool>) {
    let (mut primes, sieve) = main_helper(n);
    for x in ((n as f64).sqrt().ceil() as usize)..=n {
        if sieve[x] {
            primes.push(x as u32);
        }
    }
    (primes, sieve)
}

pub fn get_primes_upto(n: usize) -> Vec<u32> {
    let (primes, _) = get_sieve_and_primes(n);
    primes
}

pub fn get_nth_prime(n: usize) -> u32 {
    unsafe {
        let ub: f32 = n as f32 * logf32(n as f32 * logf32(n as f32));
        get_primes_upto(ceilf32(ub) as usize)[n - 1]
    }
}
