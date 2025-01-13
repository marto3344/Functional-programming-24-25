main :: IO ()
main = do
    print $ (myPoly [2.7, 3.0 ..]) 2.2 3 == -0.4399999999999998
    print $ (myPoly [2 ..]) 1 5 == -120 --my test

myPoly::(Num a) => [a]->a->Int->a
myPoly xs = (\ x y -> product $ map (x -) $  take y xs  )