main :: IO ()

main = do
    a <- readLn
    b <- readLn
    c <- readLn
    target <- readLn
    let matchedPairs = [(500*x + 100*y + 50*z) | x<-[0..a], y<-[0..b], z<-[0..c]]
    print $ length $ filter (== target) matchedPairs
