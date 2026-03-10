main :: IO ()

main = do
    a <- readLn
    b <- readLn
    c <- readLn
    target <- readLn
    let result = [(x, y, z) | x<-[0..a], y<-[0..b], z<-[0..c], (500*x + 100*y + 50*z) == target]
    print $ length result
