module Main where

solve :: Integer
solve = foldl (\a x -> if even x then a + x else a) 0 (takeWhile (<= round 4e6) fibo)
  where
    fibo = 1 : 2 : zipWith (+) fibo (tail fibo)

main :: IO ()
main = print solve
