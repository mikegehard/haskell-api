module Main where

import           Network.Wai.Middleware.RequestLogger
import           Web.Scotty
import           WebApp

main :: IO ()
main = do
    putStrLn "Starting server..."
    scotty 3000 $ do
        middleware logStdoutDev
        WebApp.routes
