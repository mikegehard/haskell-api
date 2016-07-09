{-# LANGUAGE OverloadedStrings #-}

module WebApp (routes)  where

import           Data.Aeson  (FromJSON, ToJSON)
import           Data.Monoid ((<>))
import           Debug.Trace
import           Users
import           Web.Scotty

routes :: ScottyM ()
routes = do
    get "/hello/:name" sayHello
    get "/goodbye" sayGoodBye
    get "/users" getUsers
    -- if route is /users/ then it looks like you
    -- get the /users route...pretty cool.
    get "/users/:id" getUsersForId

-- Handlers

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

getUsers :: ActionM ()
getUsers = json allUsers

getUsersForId :: ActionM ()
getUsersForId = do
    id <- param "id"
    json $ matchingUsers id allUsers
