{-# LANGUAGE FlexibleContexts #-}

module Main where

import qualified Data.HashMap.Strict as HashMap (
  HashMap, empty, insertWith, (!)
  )

import qualified Data.Heap as Heap (
  insert, viewHead, drop, singleton, MinPrioHeap
  )

import qualified Data.HashSet as HashSet (
  fromList, member, insert, HashSet, empty
  )

import Data.List (break)
import Data.Char (isSpace)
import System.Environment (getArgs)

main = do
  directOrbits <- (map $ splitOn (== ')')) . splitOn (== '\n') . trim
    <$> getContents
  [from, to] <- getArgs
  print $ (distance from to) $ addOrbits directOrbits

addOrbits :: [[String]] -> HashMap.HashMap String [String]
addOrbits = foldl addOrbit HashMap.empty where
  addOrbit orbits [parent, child] =
    HashMap.insertWith (++) parent [child] $
      HashMap.insertWith(++) child [parent] orbits

distance :: String -> String -> HashMap.HashMap String [String] -> Int
distance from to orbits =
  distance' toVisit visited where
    toVisit = Heap.singleton (0, from) :: Heap.MinPrioHeap Int String
    visited = HashSet.empty
    distance' toVisit visited =
      if id == to
      then dist
      else if HashSet.member id visited
      then distance' toVisit' visited
      else distance' toVisit'' visited' where
        Just (dist, id) = Heap.viewHead toVisit
        toVisit' = Heap.drop 1 toVisit
        toVisit'' = foldl (\toVisit child ->
                            Heap.insert (dist + 1, child) toVisit)
                          toVisit'
                          children
        visited' = HashSet.insert id visited
        children = (HashMap.!) orbits id


splitOn :: (a -> Bool) -> [a] -> [[a]]
splitOn pred lst =
  case break pred lst of
    (a, []) -> [a]
    (a, _:b) -> a:splitOn pred b

trim = reverse . dropWhile isSpace . reverse . dropWhile isSpace