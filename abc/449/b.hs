import Control.Monad (replicateM)

main :: IO ()
ints :: IO [Int]
ints = map read . words <$> getLine

solve :: Int -> Int -> [[Int]] -> [Int]
solve _ _ [] = []
solve 0 _ _ = []
solve _ 0 _ = []
solve h w ([qtype, point] : xs)
  | qtype == 1 = (point * w) : solve (h - point) w xs
  | otherwise = (point * h) : solve h (w - point) xs

main = do
  [h, w, q] <- map read . words <$> getLine :: IO [Int]
  queries <- replicateM q ints
  putStrLn . unlines . map show $ solve h w queries
