main :: IO ()

-- 問題を読み間違えていた
-- 正しくはリスト全体が偶数である場合に全ての要素を半分にしてカウントするもの

-- リストの要素を2で割ったものを返してカウントを+1する
devideBy2AndCount :: [Int] -> Int
devideBy2AndCount [] = 0
devideBy2AndCount (x:xs)
    | even x = 1 + devideBy2AndCount ((x `div` 2):xs)
    | otherwise = devideBy2AndCount xs

main = do
    n <- readLn :: IO Int
    nums <- map read . words <$> getLine :: IO [Int]
    -- リスト内法表記で条件に合うものを抽出する
    print $ devideBy2AndCount nums
