module Utils where

import Data.Char (isSpace)

run :: Show a => (String -> a) -> IO ()
run = run' "./input.txt"

run' :: Show a => FilePath -> (String -> a) -> IO ()
run' inputFilePath solution = do
  input <- readFile inputFilePath
  putStrLn . show . solution . trim $ input

trim :: String -> String
trim = shake . shake
  where shake = reverse . dropWhile isSpace

splitBy :: (a -> Bool) -> [a] -> [[a]]
splitBy _ [] = []
splitBy isSep lst =
  let (first, rest) = break isSep lst
  in  first:splitBy isSep (dropWhile isSep rest)
