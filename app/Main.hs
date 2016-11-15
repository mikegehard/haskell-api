module Main where

import           Data.Maybe
import           Network.Wai.Middleware.RequestLogger
import           System.Environment
import           Web.Scotty
import           WebApp

main :: IO ()
main = do
    putStrLn "Starting server..."
    port <- lookupEnv "PORT"
    scotty (maybe 3000 read port) $ do
        middleware logStdoutDev
        WebApp.routes
