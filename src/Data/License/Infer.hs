{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE ViewPatterns #-}
module Data.License.Infer (
  License(..)
, inferLicense
) where

import           Data.List
import           Data.Ord (comparing)
import           Data.Text (Text)
import qualified Data.Text as T
import           Data.Text.Metrics

import           Data.License.SpdxLicenses (licenses)
import           Data.License.Type

inferLicense :: String -> Maybe License
inferLicense (T.pack -> xs) = case maximumBy (comparing snd) (probabilities xs) of
  (license, n) | n > 0.85 -> Just license
  _ -> Nothing

probabilities :: Text -> [(License, Double)]
probabilities license = map (fmap probability) licenses
  where
    probability = realToFrac . levenshteinNorm license
