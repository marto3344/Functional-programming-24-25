main :: IO ()
main = do
    print $ removeFirst 5 [5, 1, 5, 3, 5] == [1, 5, 3, 5]
    print $ removeFirst 3 [5, 1, 5, 3, 5] == [5, 1, 5, 5]
    print $ removeFirst 3 [3] == [] --my test

removeFirst :: (Eq a) => a -> [a] -> [a]
removeFirst _ [] = []
removeFirst y (x:xs)
 | x == y    = xs
    | otherwise = x : removeFirst y xs