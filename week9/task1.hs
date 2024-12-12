main :: IO ()
main = do
    print $ isPresent 0 [0, -1, 2] == True
    print $ isPresent 1 [0, 1, 2] == True
    print $ isPresent 2 [0, 1, -2] == False
    print $ isPresent 3 [0, 1, 2] == False
    print $ isPresent 5 [0, 0, 5] == True --my test

isPresent :: (Eq a) => a -> [a] -> Bool
isPresent _ [] = False
isPresent p (x:xs) = p == x || isPresent p xs