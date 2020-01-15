module Main where

import Data.Map.Strict (elems, Map, empty, insert, findWithDefault)
import Data.List (break)
import Data.Char (isSpace)

main = do
  directOrbits <- ((map $ splitOn (== ')')) . splitOn (== '\n') . trim)
    <$> getContents
  print $ sum $ elems $ addOrbits directOrbits

addOrbits :: [[String]] -> Map String Integer
addOrbits = foldl addOrbit empty where
  addOrbit orbits [parent, child] =
    insert child depth orbits where
      depth = 1 + findWithDefault 0 parent orbits

splitOn :: (a -> Bool) -> [a] -> [[a]]
splitOn pred lst =
  case break pred lst of
    (a, []) -> [a]
    (a, _:b) -> a:splitOn pred b

trim = reverse . dropWhile isSpace . reverse . dropWhile isSpace