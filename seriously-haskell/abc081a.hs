main :: IO ()

countMarbles :: String -> Int
countMarbles "1" = 1
countMarbles "0" = 0
countMarbles (x:xs) = (countMarbles x) + (countMarbles xs)
-- 空リストの場合が定義されていない
-- x は Char なので型の不一致が起きている

main = do
    x <- getLine
    -- putStrLn は String を受け取るが、実際に渡されているのは Int
    putStrLn $ countMarbles x
