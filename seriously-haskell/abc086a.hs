main :: IO ()

main = do
    [a, b] <- map read . words <$> getLine :: IO [Int]
    case a*b of n | odd n -> putStrLn "Odd"
        | otherwise -> putStrLn "Even"
