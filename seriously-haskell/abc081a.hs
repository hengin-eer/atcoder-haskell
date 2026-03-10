main :: IO ()

countMarbles :: String -> Int
countMarbles "" = 0
countMarbles (x:xs)
    | x == '1' = 1 + countMarbles xs
    | otherwise = 0 + countMarbles xs

main = do
    x <- getLine
    print $ countMarbles x
