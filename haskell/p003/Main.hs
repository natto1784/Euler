module Main where

solve :: Integral a => a -> a
solve a = largestPrimeFactor 1 a
  where
    largestPrimeFactor :: Integral a => a -> a -> a
    largestPrimeFactor a x
      | even x = largestPrimeFactor 2 (div x 2)
      | a <= floor (sqrt $ fromIntegral x) = largestPrimeFactor (a + 2) (if mod x a == 0 then div x a else x)
      | x == 1 = a
      | otherwise = x

main :: IO ()
main = print $ solve 600851475143
