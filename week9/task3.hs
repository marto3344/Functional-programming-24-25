main :: IO ()
main = do
    print $ removeAll 5 [5] == []
    print $ removeAll 4 [4, 4] == []
    print $ removeAll 5 [1] == [1]
    print $ removeAll 5 [5, 1, 5, 3, 5] == [1, 3]
    print $ removeAll 3 [5, 1, 5, 3, 5] == [5, 1, 5, 5]
    print $ removeAll 3 [3, 1, 3, 3, 5] == [1,5] --my test

    print $ removeAllHOF 5 [5] == []
    print $ removeAllHOF 4 [4, 4] == []
    print $ removeAllHOF 5 [1] == [1]
    print $ removeAllHOF 5 [5, 1, 5, 3, 5] == [1, 3]
    print $ removeAllHOF 3 [5, 1, 5, 3, 5] == [5, 1, 5, 5]
    print $ removeAllHOF 3 [3, 1, 3, 3, 5] == [1,5] --my test

removeAll :: (Eq a) => a -> [a] -> [a]
removeAll _ [] = []
removeAll y (x:xs)
    | x == y = removeAll y xs
    | otherwise = x : removeAll y xs

removeAllHOF :: (Eq a) => a -> [a] -> [a]
removeAllHOF y = filter (/= y)