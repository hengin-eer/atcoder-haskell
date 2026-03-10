main :: IO ()

main = do
    -- Input
    a <- readLn :: IO Int
    [b, c] <- readLn :: IO [Int]
    s <- getLine
    -- Output
    putStrLn $ show (a + b + c) ++ " " ++ s
