module MainOrig where

import           Control.Monad (replicateM_)
import           Data.Aeson    (encode)
import           Data.Time     (getCurrentTime)
import           System.IO     (readFile)

main :: IO ()
main = do
  putStrLn "Enter a message: "
  message <- getLine
  putStrLn "Enter a number of times to print: "
  repeat <- readLn

  -- when this is specialized to IO () the
  -- return type is IO ()
  replicateM_ repeat (putStrLn message)
  -- putStrLn "Enter your name: "
  -- name <- getLine
  -- putStrLn $ greet name
  -- putStrLn $ greet "World"
  -- printTime

doSomething :: IO ()
doSomething = do
  let action = putStrLn "Hello"
  action
  action
  action
  return ()

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

beCareful :: Maybe Int
beCareful = do
  Just 6
  Nothing
  return 5
