module Main where

sumOfMultiples :: Int -> Int
sumOfMultiples x = sum [x, 2 * x .. 999]

main :: IO ()
main = print $ sumOfMultiples 3 + sumOfMultiples 5 - sumOfMultiples 15
