module Main where

import Eulerlibs.Prime (getNthPrime)

main :: IO ()
main = print $ getNthPrime 10001
