fn sum_of_multiples_below_1000(x: u32) -> u32 {
    (x..1000).step_by(x as usize).into_iter().sum()
}

fn main() {
    println!(
        "{}",
        sum_of_multiples_below_1000(5u32) +
        sum_of_multiples_below_1000(3u32) -
        sum_of_multiples_below_1000(15u32)
    )
}
