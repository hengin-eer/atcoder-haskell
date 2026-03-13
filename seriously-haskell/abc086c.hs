import Control.Monad (replicateM)
main :: IO ()

ints = map read . words <$> getLine

reachable :: [Int] -> [Int] -> Bool
-- パリティについての条件判定
reachable _ [] = True
reachable (ti:xi:yi) (tj:xj:yj)
    | dx + dy <= dt && mod dt == mod (dx + dy) = True
    | otherwise = False
        where
            dx = abs (xj - xi)
            dy = abs (yj - yi)
            dt = tj - ti

-- 移動距離マスの和が時間辺りの最大移動距離を超えないか判定

solve :: [[Int]] -> String
solve [x] = "Yes"
solve (x:xs)
    | reachable x $ head xs = solve xs
    | otherwise = "No"


main = do
    n :: Int <- readLn
    list :: [[Int]] <- replicateM n ints
    putStrLn $ solve list
