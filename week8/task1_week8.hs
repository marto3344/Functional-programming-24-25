main :: IO ()
main = do
    print $ addN [1, 2, 3, 4, 5] 9999999999999999999999 == [10000000000000000000000,10000000000000000000001,10000000000000000000002,10000000000000000000003,10000000000000000000004]
    print $ addN [1, 2, 3, 4, 5] 1 == [2, 3, 4, 5 ,6] --my test

    print $ sqAddN [1, 2, 3, 4, 5] 5 == [36,49,64,81,100]
    print $ sqAddN [7, 8, 9] 1 == [64, 81, 100] --my test

    print $ divByN [1, 2, 3, 4, 5] 5 == [0.2,0.4,0.6,0.8,1.0]
    print $ divByN [1, 2, 3, 4, 5] (-5)  == [-0.2, -0.4, -0.6, -0.8, -1.0]-- my test
    
    print $ filterByN [1, 2, 3, 4, 5] 3 == [3,4,5]
    print $ filterByN [1, 1 ,1 ,1 , 2] 2 == [2] --my test

addN :: (Num a) => [a] -> a -> [a]
addN xs n = map (+ n) xs

sqAddN :: (Num a) => [a] -> a -> [a]
sqAddN xs n = map ((^2) . (n +)) xs

divByN :: [Int] -> Int -> [Double]
divByN xs n = map ((/ fromIntegral n) . fromIntegral) xs

filterByN :: (Ord a) => [a] -> a -> [a]
filterByN xs n = filter (>= n) xs