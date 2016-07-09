module UsersSpec where

import           Test.Hspec
import           Users

spec :: Spec
spec = describe "matchingUsers"  $ do
        it "finds only users where id matches" $ do
            let
                juan = User {userId = 1, userName = "juan"}
                sue = User {userId = 2, userName = "sue"}
                actual = matchingUsers 2 [juan, sue]
                expected = [sue]
            actual `shouldBe` expected
