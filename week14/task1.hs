main::IO()
main = do
    print $ prodEvens [1,2,3,4,5,6] == 15
    print $ prodEvens [7.66, 7, 7.99, 7]  == 61.2034
    print $ prodEvens [] == 1 --my test

extractEven :: (Num a) => [(Int, a)] -> [a]
extractEven  xs = [elem | (i, elem) <- xs, even i]

prodEvens :: (Num a) => [a] -> a
prodEvens  =   foldr (*)  1 . extractEven . zip [0 ..] 