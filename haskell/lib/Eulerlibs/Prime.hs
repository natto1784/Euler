module Eulerlibs.Prime where

import Data.Sequence (Seq, empty, (<|))
import qualified Data.Set as S

-- https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf || page 7
primes :: Integral a => a -> Seq a
primes n = 2 <| sieve [3, 5 .. n]
  where
    sieve :: Integral a => [a] -> Seq a
    sieve (x : xs) = x <| helper xs (insert x (x : xs) S.empty)
    sieve [] = Data.Sequence.empty

    helper :: Integral a => [a] -> S.Set [a] -> Seq a
    helper (x : xs) table
      | next == x = helper xs (adjust x table)
      | otherwise = x <| helper xs (insert x (x : xs) table)
      where
        (next : _) = S.findMin table
    helper [] _ = Data.Sequence.empty

    adjust :: Integral a => a -> S.Set [a] -> S.Set [a]
    adjust x table
      | n == x = adjust x (S.insert (n' : ns) newSet)
      | otherwise = table
      where
        Just (n : (n' : ns), newSet) = S.minView table

    insert :: Integral a => a -> [a] -> S.Set [a] -> S.Set [a]
    insert p xs = S.insert (map (* p) xs)
