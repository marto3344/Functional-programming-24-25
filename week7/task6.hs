main :: IO ()
main = do
    print $ isPrimeG 1 == False
    print $ isPrimeG 2 == True
    print $ isPrimeG 3 == True
    print $ isPrimeG 6 == False
    print $ isPrimeG 61 == True
    print $ isPrimeG 41 == True --my test

    print $ isPrimeLC 1 == False
    print $ isPrimeLC 2 == True
    print $ isPrimeLC 3 == True
    print $ isPrimeLC 6 == False
    print $ isPrimeLC 61 == True
    print $ isPrimeLC 42 == False --my test
    
isPrimeG :: Int -> Bool
isPrimeG n
    | n == 1 = False  
    | n == 2 = True
    | otherwise = helper 2 (n - 1)
     where helper :: Int -> Int -> Bool
           helper start end
            | start >= end = True
            | otherwise = mod n start /= 0 && helper (start + 1) end  

isPrimeLC :: Int -> Bool
isPrimeLC n = n /= 1 && null [x | x <- [2 .. (n-1)],  mod n x == 0]