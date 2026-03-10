main :: IO ()

main = do
    nums <- map read . words <$> getLine
    let result = if odd $ product nums then "Odd" else "Even"
    putStrLn result
