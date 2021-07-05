fn is_palindrome(mut x: u32) -> bool {
    let a = x;
    let mut y: u32 = 0;
    while x != 0 {
        y *= 10;
        y += x % 10;
        x /= 10;
    }
    a == y
}

fn solve(n: u8) -> u32 {
    let (y, x): (u16, u16) = (10u16.pow(n as u32) - 1, 10u16.pow(n as u32 - 1));
    let mut ans: u32 = 0;
    for i in (x..=y).rev() {
        for j in (x..=i).rev() {
            let z: u32 = i as u32 * j as u32;
            if is_palindrome(z) && z > ans {
                ans = z
            }
        }
    }
    ans
}

fn main() {
    println!("{}", solve(3));
}
