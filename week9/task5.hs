main :: IO ()
main = do 
    print $ combine [] == (0,0)
    print $ combine [(1, 2), (1, 2)] == (11, 22)
    print $ combine [(3, 9), (8, 7), (7, 9), (8, 8), (5, 0), (9, 2)] == (377802, 989859)
    print $ combine [(1, 5), (1, 2)] == (11, 52) --my test

-- on func level with fold

combine :: [(Int, Int)] -> (Int, Int)
combine = foldl (\ (acc1,acc2) (x,y) -> (acc1*10 + min x y, acc2*10 + max x y)) (0, 0)  
        