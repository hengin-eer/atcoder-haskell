import Control.Monad (replicateM)
main :: IO ()

ints = map read . words <$> getLine

main = do
    n :: Int <- readLn
    list :: [[Int]] <- replicateM n ints
    -- TODO: 解いていく
    print list
