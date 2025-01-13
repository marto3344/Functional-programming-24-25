main :: IO ()
main = do
    --you may get slightly different results eg.  on test 1 <- not a problem
    print $ listLeaves [(1, 2, 3), (2, 4, 5)]  == [3, 4, 5] -- [4, 3, 5]
    print $ listLeaves [(2, 4, 5), (1, 2, 3)] == [4, 5, 3]
    print $ listLeaves [(1, 2, 3), (3, 4, 5), (5, 6, 9)] == [2, 4, 6, 9]
    print $ listLeaves [(5, 3, 2), (3, 4, 6), (2, 8, 9)] == [ 4, 6, 8, 9] --my test

type Node = (Int, Int, Int)
isLeaf:: [Node] -> Int -> Bool
isLeaf xs node = not $ any (\ (x , y, z) -> x == node) xs

listLeaves :: [Node] -> [Int]
listLeaves xs = [ l | (x,y,z) <- xs , l <- [y,z], isLeaf xs l ] 