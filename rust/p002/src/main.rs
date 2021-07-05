fn solve() -> u64 {
    let (mut x, mut y): (u64, u64) = (1, 2);
    let mut ans: u64 = 0;
    while x <= 4e6 as u64 {
        if y%2 == 0u64 {
            ans += y;
        }
        y += x;
        x = y - x;
    }
    ans
}
fn main() {
    println!("{}", solve());
}
