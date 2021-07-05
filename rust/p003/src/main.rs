fn solve(mut x: u64) -> u64 {
    let mut a: u64 = 0;
    while x % 2 == 0 {
        a = 2;
        x /= 2;
    }
    for z in 3..=((x as f64).sqrt() as u64) {
        if x % z == 0 {
            a = z;
            x /= z;
        }
    }
    return if x == 1 { a } else { x };
}

fn main() {
    println!("{}", solve(600851475143));
}
