module Run where

import Utils (trim)

run :: Show a => (String -> a) -> IO ()
run = run' "./input.txt"

run' :: Show a => FilePath -> (String -> a) -> IO ()
run' inputFilePath solution = do
  input <- readFile inputFilePath
  putStrLn . show . solution . trim $ input
