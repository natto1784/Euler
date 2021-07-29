fn solve(n: u32) -> u32 {
    // 0<a<b<c<n, a+b+c = n so a+a+a < n => 3a<n
    let (mut a, mut b, mut c) = (1, 2, 3);
    for x in (0..(n / 3 - 1)).rev() {
        a = x;
        b = (n * (n - 2 * a)) / (2 * (n - a));
        c = n - a - b;
        if b > a && c * c == b * b + a * a {
            break;
        }
    }
    a * b * c
}
fn main() {
    println!("{}", solve(1000));
}
