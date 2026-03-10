-- https://atcoder.jp/contests/abs/submissions/73667217
main :: IO ()

main = do
    _ <- readLn :: IO Int
    nums <- map read . words <$> getLine :: IO [Int]
    print $ solve nums

solve :: [Int] -> Int
solve ints
    | all even ints = 1 + (solve $ map (div 2) ints)
    | otherwise = 0
