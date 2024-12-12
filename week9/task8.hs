main :: IO ()
main = do
    print $ (rf ((-) (-4)) (* (-2))) [1..10] (* 3) == [15,18,21,24,27,30] -- only 5, 6, 7, 8, 9 and 10 satisfy the condition-- only 5, 6, 7, 8, 9 and 10 satisfy the condition
    print $ (rf ((-) (-4)) (* (-2))) [1..5] (* 2)  == [10] --my test 

type UnaryFunc = Int -> Int
type BinaryFunc = [Int] -> UnaryFunc ->[Int]

rf :: UnaryFunc -> UnaryFunc  -> BinaryFunc
rf f g = (\ xs h -> map h $ filter (\ x -> (f x) > (g x)) xs )