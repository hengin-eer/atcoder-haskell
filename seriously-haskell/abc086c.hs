import Control.Monad (replicateM)
main :: IO ()

ints :: IO [Int]
ints = map read . words <$> getLine

reachable :: [Int] -> [Int] -> Bool
-- NOTE: `(x:y:z)`では要素とリストの結合を表しているため`z`がリスト扱いになってしまう
-- `[x,y,z]`のように要素であることを明示する
-- NOTE: 真偽値を返す関数なら冗長なガード条件を削除して、条件式をそのまま返す
reachable [ti, xi, yi] [tj, xj, yj] =
    dx + dy <= dt && dt `mod` 2 == (dx + dy) `mod` 2
        where
            dx = abs (xj - xi)
            dy = abs (yj - yi)
            dt = tj - ti
reachable _ _ = True

-- NOTE: 標準関数を利用した解法のため利用せず
-- solve :: [Int] -> [[Int]] -> String
-- solve _ [] = "Yes"
-- solve x (y:ys)
--     | reachable x y = solve y ys
--     | otherwise = "No"

main = do
    n <- readLn :: IO Int
    list :: [[Int]] <- replicateM n ints
    let route = [0, 0, 0] : list
    -- NOTE: 要素が1つ違いのリストを`zip`することで隣り合う要素のペアを作れる
    -- `all`を用いてラムダ関数（ペアを`reachable`に渡すもの）をすべてのペアに適用する
    let isValid = all (\(current, next) -> reachable current next) $ zip route list
    putStrLn $ if isValid then "Yes" else "No"
