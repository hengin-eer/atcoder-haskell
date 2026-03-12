import Data.List (sort)
main :: IO ()

solve :: [Int] -> Int
solve [] = 0
solve [x] = x
solve (x:y:xs) = x - y + solve xs

main = do
    n :: Int <- readLn
    cards <- map read . words <$> getLine :: IO [Int]
    let descList = reverse $ sort cards
    print $ solve descList
