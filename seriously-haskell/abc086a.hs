main :: IO ()

main = do
    [a, b] <- map read . words <$> getLine
    let isOdd = odd (a * b)
    case isOdd of { True -> putStrLn "Odd"; False -> putStrLn "Even" }
