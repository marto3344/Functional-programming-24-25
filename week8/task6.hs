import Data.List(nub, concat)
main :: IO ()
main = do
    print $ sumUnique [[1,2,3,2],[1,-4],[1]] == 2
    print $ sumUnique [[1,2,3,2],[-4,-4],[5]] == 9 -- (= 1 + 3 + 5)
    print $ sumUnique [[2,2,2],[3,3,3],[4,4,4]] == 0
    print $ sumUnique [[1,2,3],[4,5,6],[7,8,9]] == 45
    print $ sumUnique [[1,2,3],[4,5,6],[7]] == 28 --my test

flatten :: [[a]] -> [a]
flatten = concat 

unique :: [Int] -> Int -> Bool
unique xs x =  1 == (length $ filter (== x) xs )

sumUnique :: [[Int]] -> Int
sumUnique = sum . flatten . map (\ xs -> filter (\ y -> unique xs y ) xs)