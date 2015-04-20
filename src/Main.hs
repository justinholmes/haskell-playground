{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Main where

import Data.Monoid
import Data.String
import Web.Spock.Safe
import Data.Aeson
import GHC.Generics

main :: IO ()

data User = User { name :: String, height :: Int }  deriving Generic
instance ToJSON User

main =
    runSpock 8080 $ spockT id $
    do get root $


           Web.Spock.Safe.json (map (User "10") [4,5,6,6])
       get ("hello" <//> var) $ \name ->
           text ("Hello " <> name <> "!")
