module C where

main :: IO ()
ints :: IO [Int]
ints = map read . words <$> getLine
main = do
  [n, l, r] <- ints
  s <- getLine
  -- TODO: `n`を計算して時間計算量を減らす
  let pairs = [[i, j] | i <- [0 .. n - 1 - l], j <- [l .. n - 1], i <= j && (s !! i == s !! j) && (l <= j - i && j - i <= r)]
  print $ length pairs
