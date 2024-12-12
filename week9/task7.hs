main :: IO ()
main = do
    print $ isSorted [-5, -5, -6] == True
    print $ isSorted [-5, -5, -4] == True
    print $ isSorted [1, 1, 1, 1, 1, 1, 1, 1, 1] == True
    print $ isSorted [1, 2, 3, 3, 3, 4, 5, 6, 6] == True
    print $ isSorted [1, -1, -3, -3, -3, -4, -5, -6, -6] == True
    print $ isSorted [1, 2, 3, 3, 3, 4, 5, 6, 5] == False
    print $ isSorted [-100, -99, -99, -99] == True
    print $ isSorted [-100, -99, -99, -99, 100] == True
    print $ isSorted [100, 101, -102] == False
    print $ isSorted [1, 2, 3, 4, 5, 6] == True
    print $ isSorted [-1, -2, -3, -4, -5, -6] == True
    print $ isSorted [-1.2, -2.99, -3.14, -4.8, -5.2, -6.5] == True --my test

    print $ isSortedXs [-5, -5, -6] == True
    print $ isSortedXs [-5, -5, -4] == True
    print $ isSortedXs [1, 1, 1, 1, 1, 1, 1, 1, 1] == True
    print $ isSortedXs [1, 2, 3, 3, 3, 4, 5, 6, 6] == True
    print $ isSortedXs [1, -1, -3, -3, -3, -4, -5, -6, -6] == True
    print $ isSortedXs [1, 2, 3, 3, 3, 4, 5, 6, 5] == False
    print $ isSortedXs [-100, -99, -99, -99] == True
    print $ isSortedXs [-100, -99, -99, -99, 100] == True
    print $ isSortedXs [100, 101, -102] == False
    print $ isSortedXs [1, 2, 3, 4, 5, 6] == True
    print $ isSortedXs [-1, -2, -3, -4, -5, -6] == True
    print $ isSortedXs [-1.2, -2.99, -3.14, -4.8, -5.2, -6.5] == True --my test


type Predicate a =  a -> a -> Bool

isSortedHof :: (Ord a ) => [a] -> Predicate a -> Bool 
isSortedHof [] _ = True
isSortedHof [_] _ = True
isSortedHof (x:y:xs) pred  = pred x y && isSortedHof (y:xs) pred
               

isSorted :: (Ord a ) => [a] -> Bool
isSorted xs = isSortedHof xs (<=) || isSortedHof xs (>=)

isSortedXs :: (Ord a ) => [a] -> Bool
isSortedXs (x:xs) =  (all (\(x,y) -> x <= y) . zip (x:xs) $  xs) || (all (\(x,y) -> x >= y) . zip (x:xs) $  xs)