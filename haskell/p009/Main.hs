module Main where

solve :: Integer -> Integer
solve n = solve' n (div n 3 - 1)
  where
    solve' :: Integer -> Integer -> Integer
    solve' n a
      | c * c == a * a + b * b && b > a = (a * b) * c
      | otherwise = solve' n (a - 1)
      where
        b :: Integer
        b = div (n * (n -2 * a)) (2 * (n - a))
        c :: Integer
        c = n - a - b

main :: IO ()
main = print $ solve 1000
