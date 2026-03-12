import Data.List (sort, nub)
import Control.Monad (replicateM)
main :: IO ()

solve :: [Int] -> Int
solve list = length uniqueList
    where
        descList = reverse $ sort list
        -- 重複排除を行う
        uniqueList = nub descList

main = do
    n :: Int <- readLn
    list <- replicateM n readLn
    let result = solve list
    print result
