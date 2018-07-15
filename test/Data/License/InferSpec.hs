module Data.License.InferSpec (spec) where
import           Test.Hspec

import           Control.Monad

import           Data.License.Infer

spec :: Spec
spec = do
  describe "inferLicense" $ do
    it "rejects unknown licenses" $ do
      inferLicense "unknown" `shouldBe` Nothing

    forM_ [minBound .. maxBound] $ \ l -> do
      let license = show l
      it ("infers " ++ license) $ do
        inferLicense <$> readFile ("test/resources/" ++ license) `shouldReturn` Just l
