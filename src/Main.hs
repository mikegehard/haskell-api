{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Data.Monoid ((<>))
import           Debug.Trace
import           Web.Scotty

main :: IO ()
main = do
    putStrLn "Starting server..."
    scotty 3000 routes

routes :: ScottyM ()
routes = do
    get "/hello/:name" sayHello
    get "/goodbye" sayGoodBye

-- this returns a 500 if the ':name' is missing
-- from the route above.
-- if the :name is there and you don't pass it in (/hello/)
-- then you get an empty string
sayHello :: ActionM()
sayHello = do
    name <- param "name"
    text ("Hello " <> trace (show name) name <> "!")

sayGoodBye :: ActionM ()
-- you don't need the do if you only have one monadic action
sayGoodBye = text "Goodbye!"
