main :: IO ()

include :: String -> String -> Bool
include _ [] = True
include [] (y:ys) = False
include (x:xs) (y:ys)
    | x == y = include xs ys
    | otherwise = False

solve :: String -> String
solve [] = "YES"
solve xs
    | include xs "maerd" || include xs "esare" = solve $ drop 5 xs
    | include xs "reraser" = solve $ drop 6 xs
    | include xs "remaerd" = solve $ drop 7 xs
    | otherwise = "NO"


main = do
    s <- getLine
    putStrLn $ solve $ reverse s
