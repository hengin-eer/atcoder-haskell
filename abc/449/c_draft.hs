main :: IO ()

ints :: IO [Int]
ints = map read . words <$> getLine

-- getC :: Int -> String -> Char
-- getC _ [] = '\0'
-- getC n xs
--     | take n xs == [] = '\0'
--     | otherwise = head $ take n xs

main = do
    [n, l, r] <- ints
    s <- getLine
    -- let pairs = [[i, j] | i <- [0..n], j <- [0..n], i <= j && getC i s == getC j s]
    let pairs = [[i, j] | i <- [0 .. n - 1], j <- [0 .. n - 1], i <= j && (s !! i == s !! j) && (l <= j - i && j - i <= r)]
    print $ length pairs
