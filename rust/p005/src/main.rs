use eulerlibs::prime::get_sieve_and_primes;

fn solve(x: u32) -> u32 {
    if x == 1 {
        return 2u32;
    }
    let (a, _) = get_sieve_and_primes::<{ 1e6 as usize }>();
    let mut prime_iter = a.iter();
    let mut ans = 1u32;
    while let Some(g) = prime_iter.next() {
        if g > &x {
            break;
        }

        let mut h: u32 = g.clone();
        while h * g <= x {
            h *= g;
        }
        ans *= h;
    }

    ans
}

fn main() {
    println!("{}", solve(20));
}
