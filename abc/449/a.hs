main :: IO ()

solve :: Double -> Double
solve x = pi * square r
    where
        r = x / 2
        square x = x ^ 2

main = do
    d <- readLn :: IO Double
    print $ solve d
