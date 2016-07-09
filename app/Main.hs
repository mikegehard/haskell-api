module Main where

import           Web.Scotty
import           WebApp

main :: IO ()
main = do
    putStrLn "Starting server..."
    scotty 3000 routes
