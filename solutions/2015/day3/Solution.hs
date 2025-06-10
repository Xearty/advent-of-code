module Solution (part1, part2) where

import qualified Data.Set as Set
import Data.List (partition)

type Position = (Int, Int)

move :: Position -> Char -> Position
move (x, y) '^' = (x, y + 1)
move (x, y) 'v' = (x, y - 1)
move (x, y) '>' = (x + 1, y)
move (x, y) '<' = (x - 1, y)
move pos    _   = pos

splitMoves :: [a] -> ([a], [a])
splitMoves moves =
  let indexedMoves = zip [0..] moves
      (evenIndexed, oddIndexed) = partition (even . fst) indexedMoves
  in (map snd evenIndexed, map snd oddIndexed)

part1 :: String -> Int
part1 = Set.size . Set.fromList . scanl move (0, 0)

part2 :: String -> Int
part2 input =
  let (santaMoves, roboMoves) = splitMoves input
      santaPath = scanl move (0, 0) santaMoves
      roboPath  = scanl move (0, 0) roboMoves
  in Set.size $ Set.fromList (santaPath ++ roboPath)
