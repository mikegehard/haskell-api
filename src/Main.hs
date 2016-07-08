module Main where

main :: IO ()
main = do
  putStrLn "Enter your name: "
  name <- getLine
  putStrLn $ greet name
  putStrLn $ greet "World"

greet :: String -> String
greet name = "Hello " ++ name ++ "!"
