module Utils where

import Data.Char (isSpace)

run :: Show a => (String -> a) -> IO ()
run = run' "./input.txt"

run' :: Show a => FilePath -> (String -> a) -> IO ()
run' inputFilePath solution = do
  input <- readFile inputFilePath
  putStrLn $ show . solution $ trim input
  where
    trim :: String -> String
    trim = f . f
      where f = reverse . dropWhile isSpace
