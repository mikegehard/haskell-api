{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Web.Scotty

main :: IO ()
main = do
    putStrLn "Starting server..."
    scotty 3000 routes

routes :: ScottyM ()
routes = do
    get "/hello" sayHello

sayHello :: ActionM()
sayHello = do
    text "Hello!"
