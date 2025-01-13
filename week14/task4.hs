main :: IO ()
main = do
    print $ maximumLevel t1 == 2
    print $ maximumLevel t2 == 3
    print $ maximumLevel t3 == 3
    print $ maximumLevel t4 == 1 --my test

getLevel :: BTree a -> Int -> [a]
getLevel Nil _ = []
getLevel (Node v _ _) 1 = [v]
getLevel (Node v left right) n = getLevel left (n - 1) ++ getLevel right (n - 1)

maximumLevel :: (Num a, Ord a) => BTree a -> Int
maximumLevel tree = helper tree 1 1 0
        where helper :: (Num a, Ord a) =>BTree a -> Int -> Int -> a ->Int
              helper t maxLvl curr maxSum 
               | null (getLevel t curr) = maxLvl
               | (sum $ getLevel t curr) >= maxSum = helper t curr  (curr + 1) (sum $ getLevel t curr)
               | otherwise = helper t maxLvl (curr + 1) maxSum
                     
data BTree a = Nil | Node a (BTree a) (BTree a)

t1 :: BTree Int
t1 = Node 94 (Node 73 Nil (Node 80 Nil Nil)) (Node 87 (Node 73 Nil Nil) Nil)

t2::BTree Int
t2 = Node 94 (Node 73 Nil (Node 80 Nil Nil)) (Node 87 (Node 73 Nil Nil) (Node 7 Nil Nil))

t3::BTree Int
t3 = Node 94 (Node 0 Nil (Node 42 Nil Nil)) (Node 0 (Node 42 Nil Nil) (Node 42 Nil Nil))

t4::BTree Int
t4 = Node 99994 (Node 0 Nil (Node 42 Nil Nil)) (Node 0 (Node 42 Nil Nil) (Node 42 Nil Nil))