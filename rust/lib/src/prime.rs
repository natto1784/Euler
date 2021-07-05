fn main_helper<const N: usize>() -> (Vec<u32>, [bool; N + 1]) {
    let mut sieve: [bool; N + 1] = [true; N + 1];
    let mut primes: Vec<u32> = Vec::new();
    for x in 2..=((N as f64).sqrt() as usize) {
        if sieve[x] {
            for y in (x * x..=N).step_by(x) {
                sieve[y] = false;
            }
            primes.push(x as u32);
        }
    }
    (primes, sieve)
}

pub fn make_sieve<const N: usize>() -> [bool; N + 1] {
    let (_, sieve) = main_helper::<N>();
    sieve
}

pub fn get_sieve_and_primes<const N: usize>() -> (Vec<u32>, [bool; N + 1]) {
    let (mut primes, sieve) = main_helper::<N>();
    for x in ((N as f64).sqrt() as usize)..N {
        if sieve[x] {
            primes.push(x as u32);
        }
    }
    (primes, sieve)
}
