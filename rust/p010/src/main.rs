use eulerlibs::prime::get_primes_upto;

fn solve(x: u32) -> u64 {
    let a: Vec<u32> = get_primes_upto(x as usize - 1);
    let mut prime_iter = a.iter();
    let mut ans: u64 = 0;
    while let Some(g) = prime_iter.next() {
        ans += *g as u64;
    }
    ans
}

fn main() {
    println!("{}", solve(2e6 as u32));
}
