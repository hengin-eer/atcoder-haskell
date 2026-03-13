import Control.Monad (replicateM)
main :: IO ()

ints = map read . words <$> getLine

reachable :: [Int] -> [Int] -> Bool
reachable _ [] = True
-- NOTE: `(x:y:z)`では要素とリストの結合を表しているため`z`がリスト扱いになってしまう
-- `[x,y,z]`のように要素であることを明示する
reachable [ti, xi, yi] [tj, xj, yj]
    | dx + dy <= dt && dt `mod` 2 == (dx + dy) `mod` 2 = True
    | otherwise = False
        where
            dx = abs (xj - xi)
            dy = abs (yj - yi)
            dt = tj - ti

solve :: [[Int]] -> String
solve [x] = "Yes"
solve (x:xs)
    | reachable x $ head xs = solve xs
    | otherwise = "No"


main = do
    n :: Int <- readLn
    list :: [[Int]] <- replicateM n ints
    putStrLn $ solve list
