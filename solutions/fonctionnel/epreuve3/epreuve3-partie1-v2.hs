module Main where

import Data.HashMap.Strict (elems, HashMap, empty, insert, lookupDefault)
import Data.List (break)
import Data.Char (isSpace)

newtype LazyDepthHashMap = LDHM (HashMap String (LazyDepthHashMap -> Integer))

main = do
  directOrbits <- (map $ splitOn (== ')')) . splitOn (== '\n') . trim
    <$> getContents
  let (LDHM orbits) = addOrbits directOrbits in
    print $ foldl (\nOrbits depthFn -> nOrbits + (depthFn (LDHM orbits))) 0 $
      elems orbits

addOrbits :: [[String]] -> LazyDepthHashMap
addOrbits = foldl addOrbit (LDHM empty) where
  addOrbit (LDHM orbits) [parent, child] =
    LDHM (insert child depth orbits) where
      depth = \(LDHM orbits) ->
                1 + ((lookupDefault (\_ -> 0) parent orbits) (LDHM orbits))

splitOn :: (a -> Bool) -> [a] -> [[a]]
splitOn pred lst =
  case break pred lst of
    (a, []) -> [a]
    (a, _:b) -> a:splitOn pred b

trim = reverse . dropWhile isSpace . reverse . dropWhile isSpace