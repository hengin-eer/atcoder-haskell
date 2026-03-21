{-# LANGUAGE OverloadedStrings #-}

import Data.ByteString.Char8 (ByteString)
import Data.ByteString.Char8 qualified as BC8
import Data.Text (Text)
import Data.Text.IO qualified as TIO

cat :: ByteString
cat = "Meow!"

dog :: Text
dog = "こんにちは世界"

main :: IO ()
main = do
  BC8.putStrLn cat
  TIO.putStrLn dog
