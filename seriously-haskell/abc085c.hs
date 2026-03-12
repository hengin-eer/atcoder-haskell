main :: IO ()

solve :: Int -> Int -> [Int]
-- 条件に当てはまるリストを見つける
-- NOTE: head とリスト連結で初期値を設定できる by AI
solve n y = head $
    [[na, nb, nc] | na <- [0..n], nb <- [0..n - na], let nc = (n - na - nb), 1000*na + 5000*nb + 10000*nc == y]
    ++ [[-1, -1, -1]]

main = do
    [n, y] <- map read . words <$> getLine :: IO [Int]
    print $ solve n y
