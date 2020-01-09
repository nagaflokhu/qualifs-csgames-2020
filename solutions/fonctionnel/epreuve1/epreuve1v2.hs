module Main where

padovan = 1:1:1:(zipWith3 (\a b c -> a + b)
                          padovan
                          (drop 1 padovan)
                          (drop 2 padovan))

main =
  do n <- getLine
     print $ head $ drop ((read :: String -> Int) n) padovan