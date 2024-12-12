main :: IO ()
main = do
    print $ isImage [1, 2, 3, 4] [2, 3, 4, 5] == (True, 1)
    print $ isImage [1, 2, 3, 4] [4, 5, 6, 7] == (True, 3)
    print $ isImage [4, 5, 6, 7] [1, 2, 3, 4] == (True, -3)
    print $ isImage [1, 2, 3, 4] [4, 5, 6, 6] == (False, 0)
    print $ isImage [1, 2] [-1, -2] == (False, 0)
    print $ isImage [1, 2, 3, 4] [2, 3, 4, 4] == (False, 0)
    print $ isImage [1, 2, 3, 4] [1, 2, 3, 4] == (True, 0) --my test

isImage :: (Eq a, Num a) => [a] -> [a] -> (Bool, a)
isImage (x:xs) (y:ys)
    | y:ys == map (\ l -> l + y - x) (x:xs) = (True, y - x )
    | otherwise = (False , 0)