module Main where

import           Data.Aeson (encode)
import           Data.Time  (getCurrentTime)
import           System.IO  (readFile)

main :: IO ()
main = do
  putStrLn "Enter your name: "
  name <- getLine
  putStrLn $ greet name
  putStrLn $ greet "World"
  printTime

greet :: String -> String
greet name = "Hello " ++ name ++ "!"

printConfig :: IO ()
printConfig = do
  contents <- readFile "stack.yaml"
  putStrLn contents

printTime :: IO ()
printTime = do
  time <- getCurrentTime
  print time

numbers :: [Int]
numbers = [1,2,3,4]

printNumbers = print $ encode numbers
