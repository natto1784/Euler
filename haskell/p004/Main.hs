module Main where

solve :: (Integral a, Show a) => a -> a
solve a = maximum [z | x <- reverse [m .. n], y <- reverse [m .. x], let z = x * y, let s = show z, s == reverse s]
  where
    n :: Integral a => a
    n = round (10 ** fromIntegral a) - 1
    m :: Integral a => a
    m = round (10 ** fromIntegral (a - 1))

main :: IO ()
main = print $ solve 3
