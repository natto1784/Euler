fn solve() -> u32 {
    let (mut x, mut y): (u32, u32) = (1, 2);
    let mut ans: u32 = 0;
    while x <= 4e6 as u32 {
        if y%2 == 0u32 {
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
