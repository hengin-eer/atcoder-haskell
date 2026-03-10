main :: IO ()

countTwo :: Int -> Int
countTwo x0 = inner 0 x0
    -- where によって変数・関数を後付けで定義できる
    where
        -- inner は自作関数であり、慣習的によく使われる内部用ヘルパー関数の名前
        inner count x
            -- 要素が偶数じゃなければカウントを返して終了
            | x `mod` 2 == 1 = count
            -- そうじゃないならカウントをインクリメントして要素を半分にして再帰
            | otherwise = inner (count + 1) (x `div` 2)

main = do
    _ <- readLn :: IO Int
    nums <- map read . words <$> getLine :: IO [Int]
    -- map で全要素に対して2で割れる回数を求めてリストを生成する
    let counts = map countTwo nums
    -- リストの中で最小のカウントが解になる
    print $ minimum counts
