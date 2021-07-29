module Main where

import Data.Sequence (Seq, index)
import Eulerlibs.Prime (primes)

solve :: Int -> Int
solve x = helper (primes x) 0 1 x
  where
    helper :: Seq Int -> Int -> Int -> Int -> Int
    helper primes' i g x
      | i < length primes' = let val = index primes' i in helper primes' (i + 1) (g * helper' val val x) x
      | otherwise = g

    helper' :: Int -> Int -> Int -> Int
    helper' g h x
      | g * h <= x = helper' g (g * h) x
      | otherwise = h

main :: IO ()
main = print $ solve 20
