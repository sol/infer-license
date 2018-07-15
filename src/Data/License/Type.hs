module Data.License.Type where

data License =
    MIT

  | BSD2
  | BSD3
  | BSD4

  | GPLv2
  | GPLv3

  | LGPLv2_1
  | LGPLv3

  | AGPLv3
  deriving (Eq, Show, Bounded, Enum)
