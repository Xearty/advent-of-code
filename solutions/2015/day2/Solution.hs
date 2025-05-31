module Solution (part1, part2) where

import Data.List (sort)
import Control.Applicative (liftA2)
import Utils (splitBy)

data Box = Box { pLength :: Int
               , pWidth  :: Int
               , pHeight :: Int
               } deriving (Show)

parseBox :: String -> Box
parseBox str = case splitBy (== 'x') str of
  [lStr, wStr, hStr] -> Box (read lStr) (read wStr) (read hStr)
  _                  -> error $ "Invalid box format: " ++ str

parseInput :: String -> [Box]
parseInput = map parseBox . lines

wrappingPaperNeeded :: Box -> Int
wrappingPaperNeeded Box { pLength = l, pWidth = w, pHeight = h } =
  let areas = [l * w, w * h, h * l]
      surfaceArea = 2 * sum areas
      slack = minimum areas
  in surfaceArea + slack

ribbonToWrap :: Box -> Int
ribbonToWrap Box { pLength = l, pWidth = w, pHeight = h } =
  let [smallest, secondSmallest, _] = sort [l, w, h]
  in  2 * (smallest + secondSmallest)

ribbonForBow :: Box -> Int
ribbonForBow Box { pLength = l, pWidth = w, pHeight = h } = l * w * h

totalRibbonForBox :: Box -> Int
totalRibbonForBox = liftA2 (+) ribbonToWrap ribbonForBow

part1 :: String -> Int
part1 = sum . map wrappingPaperNeeded . parseInput

part2 :: String -> Int
part2 = sum . map totalRibbonForBox . parseInput
