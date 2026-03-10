main :: IO ()

digitSum :: Int -> Int
digitSum 0 = 0
digitSum x = remainder + digitSum quotient
    where
        quotient = x `div` 10
        remainder = x `mod` 10

main = do
    [n, a, b] <- map read . words <$> getLine :: IO [Int]
    let result = [x | x <- [1..n], a <= (digitSum x) && (digitSum x) <= b]
    print $ sum result

