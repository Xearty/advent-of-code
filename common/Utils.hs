module Utils where

import Data.Char (isSpace)

trim :: String -> String
trim = shake . shake
  where shake = reverse . dropWhile isSpace

splitBy :: (a -> Bool) -> [a] -> [[a]]
splitBy _ [] = []
splitBy isSep lst =
  let (first, rest) = break isSep lst
  in  first:splitBy isSep (dropWhile isSep rest)
