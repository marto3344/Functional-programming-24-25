main :: IO ()
main = do
    print $ sumRats (2, 5) (5, 2) == (29, 10)
    print $ sumRats (52, 123) (96, 14) == (6268, 861)
    print $ sumRats (2, 5) (3, 5) == (1, 1)
    print $ sumRats (6, 10) (0 , 1) == (3 , 5) --my test

    print $ multiplyRats (2, 5) (5, 2) == (1, 1)
    print $ multiplyRats (52, 123) (96, 14) == (832, 287)
    print $ multiplyRats (2, 5) (3, 5) == (6, 25)
    print $ multiplyRats (1 , 5) (6 ,6) == (1 , 5) --my test

    print $ divideRats (2, 5) (5, 2) == (4, 25)
    print $ divideRats (52, 123) (96, 14) == (91, 1476)
    print $ divideRats (2, 5) (3, 5) == (2, 3)
    print $ divideRats (2, 5) (2,5) == (1 , 1) -- my test

    print $ areEqual (2, 5) (5, 2) == False
    print $ areEqual (52, 123) (52 * 3, 123 * 3) == True
    print $ areEqual (2, 6) (5, 15) == True
    print $ areEqual (0,10) (0 ,10000) == True -- my test

type Rat = (Int, Int)

normalize :: Rat -> Rat
normalize (_, 0) = let highestCommDenom = gcd x y
normalize (x, y) = let highestCommDenom = gcd x y
    in (div x highestCommDenom, div y highestCommDenom)

sumRats :: Rat -> Rat -> Rat
sumRats (x1,y1) (x2,y2) = normalize (x1*y2 + x2*y1, y1*y2)

multiplyRats :: Rat -> Rat -> Rat
multiplyRats (x1 , y1) (x2,y2) = normalize (x1*x2 , y1*y2)

divideRats :: Rat -> Rat -> Rat
divideRats (x1, y1) (x2, y2) = normalize (x1 *y2 , x2*y1)

areEqual :: Rat -> Rat -> Bool
areEqual x y = normalize x == normalize y
