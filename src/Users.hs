{-# LANGUAGE DeriveGeneric #-}

-- only export the public interface
module Users (Users.all, matching, User(..)) where

import           Data.Aeson
import           GHC.Generics

data User = User {userId :: Int, userName :: String} deriving (Show, Generic, Eq)

bob :: User
bob = User {userId = 1, userName = "bob"}

jenny :: User
jenny = User {userId = 2, userName = "jenny"}

all :: [User]
all = [bob, jenny]

matching :: Int -> [User] -> [User]
matching id = filter (matchesId id)

matchesId :: Int -> User -> Bool
matchesId id user = userId user == id

-- implement the typeclasses for JSON using Generics
instance ToJSON User
instance FromJSON User

