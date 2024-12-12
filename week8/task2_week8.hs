import Data.Char(intToDigit)
main :: IO ()
main = do
    print $ sumSpecialPrimes 5 2 == 392
    print $ sumSpecialPrimes 5 3 == 107
    print $ sumSpecialPrimes 10 3 == 462
    print $ sumSpecialPrimes 3 1 == 41 --my test

prime :: Int -> Bool
prime n = n > 0 && n /= 1 && null [x | x <- [2 .. n - 1],  mod n x == 0]

containsDigit :: Int -> Int -> Bool
containsDigit n d = any (== intToDigit d) $ show n 

sumSpecialPrimes :: Int -> Int -> Int
sumSpecialPrimes n d = sum $ take n [x | x <- [2 ..], prime x && containsDigit x d]