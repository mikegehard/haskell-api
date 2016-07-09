{-# LANGUAGE DeriveGeneric #-}

-- only export the public interface
module Users (allUsers, matchingUsers) where

import           Data.Aeson
import           Debug.Trace
import           GHC.Generics

data User = User {userId :: Int, userName :: String} deriving (Show, Generic)

bob :: User
bob = User {userId = 1, userName = "bob"}

jenny :: User
jenny = User {userId = 2, userName = "jenny"}

allUsers :: [User]
allUsers = [bob, jenny]

matchingUsers :: Int -> [User]
matchingUsers id = filter (matchesId id) allUsers

matchesId :: Int -> User -> Bool
matchesId id user = userId user == id

-- implement the typeclasses for JSON using Generics
instance ToJSON User
instance FromJSON User

