import Data.List (sort)
main :: IO ()

-- sort実装
quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort [x] = [x]
quickSort (x:xs) = quickSort l ++ [x] ++ quickSort r
    where
        l = filter (<= x) xs
        r = filter (>= x) xs

mergeSort :: Ord a => [a] -> [a]
mergeSort []  = []
mergeSort [x] = [x]
mergeSort xs  = merge (mergeSort left) (mergeSort right)
  where
    (left, right) = splitAt (length xs `div` 2) xs
    merge [] ys = ys
    merge xs [] = xs
    merge (x:xs) (y:ys)
        | x <= y    = x : merge xs (y:ys)
        | otherwise = y : merge (x:xs) ys

solve :: [Int] -> Int
solve [] = 0
solve [x] = x
solve (x:y:xs) = x - y + solve xs

main = do
    n :: Int <- readLn
    cards <- map read . words <$> getLine :: IO [Int]
    -- 降順でカードを半分に分けていき、最後にそれらの和の差をとる
    let descList = reverse $ sort cards
    print $ solve descList
