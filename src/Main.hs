{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Web.Scotty

main = do
    putStrLn "Starting server..."
    scotty 3000 $ do
        get "/hello" $ do
            text "Hello world!"
