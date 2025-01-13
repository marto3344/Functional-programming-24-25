
main :: IO ()
main = do
    print $ isGraceful t1 == True
    print $ isGraceful t2 == False
    print $ isGraceful t3 == True --my test

{-
1. What is the name of the procedure/function? myPoly
2. How many parameters does it take? 1
3. What is the type of the parameters? Num a => [a]
4. What are the names of the parameters?xs
5. What is the return type? a-> a -> a
6. Break the task into smaller tasks. List them.
-}
myPoly::(Num a) => [a]->a->Int->a
myPoly xs = (\ x y -> product $ map (x -) $  take y xs  ) 

isGraceful ::  NTree Int -> Bool
isGraceful Nil = True
isGraceful (Node v children) = all (\ (Node x xs) -> even $ abs (v - x)) children && all isGraceful children

data NTree a = Nil | Node a [NTree a]

t1 :: NTree Int
t1 = Node 1 [Node 3 [], Node 5 [], Node 7 [], Node 9 []]

t2:: NTree Int
t2 = Node 7 [ Node 9 [Node 5 [], Node 2 []]]

t3 :: NTree Int
t3 = Node 0 [Node 4 [Node 8 []], Node 2 [], Node 6 []]