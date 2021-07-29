fn solve(n: usize) -> usize {
    let (s, ss) = ((n * (n + 1)) / 2, (n * (n + 1) * (2 * n + 1)) / 6);
    s * s - ss
}

fn main() {
    println!("{}", solve(100));
}
