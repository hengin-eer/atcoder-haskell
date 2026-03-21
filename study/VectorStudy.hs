module VectorStudy where

import Data.Vector qualified as V

main :: IO ()
main = do
  let animals = V.fromList ["Dog", "Pig", "Cat", "Fox", "Mouse", "Cow", "Horse"]
  let result = animals V.! 3
  print result
