module Main where

import Data.Sequence (Seq, index)
import Eulerlibs.Prime (primes)

solve :: Int -> Int
solve n = sum $ primes (n -1)

main :: IO ()
main = print $ solve $ round 2e6
