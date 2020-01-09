module Main where

padovan :: Integer -> Integer
padovan x
  | x < 0 = error "The Padovan Suite is only defined for positive integers"
  | x < 3 = 1
  | otherwise = padovan_iter (x - 2) (1,1,1)
  where padovan_iter x (a, b, c)
          | x == 0 = c
          | otherwise = padovan_iter (x - 1) (b, c, a + b)

main = getLine >>= (print . padovan . (read :: String -> Integer))