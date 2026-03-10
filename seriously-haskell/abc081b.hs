main :: IO ()

countTwo :: Int -> Int
countTwo x0 = inner 0 x0
    where
        inner count x
            | x `mod` 2 == 1 = count
            | otherwise = inner (count + 1) (x `div` 2)

main = do
    _ <- readLn :: IO Int
    nums <- map read . words <$> getLine :: IO [Int]
    let counts = map countTwo nums
    print $ minimum counts
