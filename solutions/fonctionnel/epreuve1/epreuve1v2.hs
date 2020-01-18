module Main where

padovan = 1:1:1:zipWith (+) padovan (drop 1 padovan)

main :: IO ()
main =
  do n <- getLine
     if ((read :: String -> Int) n) < 0
     then error "Veuillez entrer un indexe non-négatif."
     else print $ head $ drop ((read :: String -> Int) n) padovan