main :: IO ()
main = do
    print $ getAreas [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] == [78.53981633974483,11.25,113.30000000000001,9.127927385194024,6283.185307179587]
    print $ getAreas [Triangle 5.3 3.9 4.89, Rectangle 5 2, Rectangle 3 3] == [9.127927385194024,10 ,9] --my test

    print $ maxArea [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] == Cylinder 20.0 30.0
    print $ maxArea [Rectangle 2 5, Circle 5] == Circle 5.0 -- my test

data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a
 deriving (Show, Eq, Read, Ord)

area :: Floating a => Shape a -> a
area (Circle r) = pi*r**2
area (Rectangle x y) = x*y
area (Triangle a b c) = sqrt((p*(p - a)*(p - b)*(p - c)))
                        where p = (a + b + c)/2
area (Cylinder r h) = 2*pi*r*h + 2*pi*r**2

getAreas :: (Floating a) => [Shape a] -> [a]
getAreas = map area

compareAreas :: (Floating a, Ord a) => Shape a -> Shape a -> Shape a
compareAreas x y
 | area x >= area y = x
 | otherwise = y

maxArea :: (Floating a, Ord a) => [Shape a] -> Shape a
maxArea = foldl1 compareAreas   