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
    get "/goodbye" sayGoodBye

sayHello :: ActionM()
sayHello = do
    text "Hello!"

sayGoodBye :: ActionM ()
-- you don't need the do if you only have one monadic action
sayGoodBye = text "Goodbye!"
