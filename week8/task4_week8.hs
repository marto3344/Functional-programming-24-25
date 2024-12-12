main :: IO ()
main = do
    print $ primesInRange 1 100 == [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]
    print $ primesInRange 100 1 == [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]
    print $ primesInRange 20 1 == [2,3,5,7,11,13,17,19]

prime :: Int -> Bool
prime n = n > 0 && n /= 1 && null [x | x <- [2 .. n - 1],  mod n x == 0]

primesInRange :: Int -> Int -> [Int]
primesInRange start end = [x | x <- [min start end .. max start end], prime x]