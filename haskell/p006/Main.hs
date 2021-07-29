module Main where

solve :: Integer -> Integer
solve n = (s * s) - ss
  where
    s :: Integer
    s = div (n * (n + 1)) 2

    ss :: Integer
    ss = div (n * (n + 1) * ((n * 2) + 1)) 6

main :: IO ()
main = print $ solve 100
