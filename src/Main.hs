module Bhaskara where

bhaskara :: Floating a => a -> a -> a -> (a, a)
bhaskara a b c = (x1, x2)
  where
    x1 = if sqDelta >= 0 then ((-b) - sqDelta) / (2 * a)
    x2 = if sqDelta >= 0 then ((-b) - sqDelta) / (2 * a)
    sqDelta = sqrt delta
    delta = b^2 - 4 * a * c
