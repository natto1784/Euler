module Main where

solve :: Integer
solve = sum $ filter even $ takeWhile (<= round 4e6) fibo
  where
    fibo = 1 : 2 : zipWith (+) fibo (tail fibo)

main :: IO ()
main = print solve
