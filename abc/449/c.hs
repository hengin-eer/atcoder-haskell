main :: IO ()

ints :: IO [Int]
ints = map read . words <$> getLine

main = do
    [n, l, r] <- ints
    s <- getLine
    let pairs = [[i, j] | i <- [0 .. n - 1], j <- [0 .. n - 1], i <= j && (s !! i == s !! j) && (l <= j - i && j - i <= r)]
    print $ length pairs
