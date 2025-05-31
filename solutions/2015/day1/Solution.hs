module Solution (part1, part2) where

import Data.List

updateFloor :: Int -> Char -> Int
updateFloor floorLevel '(' = floorLevel + 1
updateFloor floorLevel ')' = floorLevel - 1

part1 :: String -> Int
part1 = foldl updateFloor 0

part2 :: String -> Int
part2 instructions =
  case findIndex (== -1) floorAtSteps of
    Just index -> index
    Nothing    -> error "Santa never enters the basement with these instructions."
  where
    floorAtSteps = scanl updateFloor 0 instructions
