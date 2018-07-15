module Data.License.Type where

data License =
    MIT
  | BSD2
  | BSD3
  | BSD4
  deriving (Eq, Show, Bounded, Enum)
