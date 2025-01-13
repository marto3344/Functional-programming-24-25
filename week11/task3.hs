main :: IO ()
main = do

    print $ ordered t1  == True 
    print $ ordered t2  == False
    print $ ordered myTree  == True -- my test


data BTree a = Empty | Node (a , a) (BTree a)  (BTree a) 

t1 :: BTree Int
t1 = Node (3 ,10 ) (Node (5, 8) (Node (6,7) Empty Empty) (Node (4,9) Empty Empty)) (Node (2, 12) Empty (Node (1,15) Empty Empty))

t2 :: BTree Int
t2 = Node (3 ,10 ) (Node (5, 8) (Node (6,7) Empty Empty) (Node (7,9) Empty Empty)) (Node (2, 12) Empty (Node (1,15) Empty Empty))

myTree :: BTree Double 
myTree = Node (5.0, 8.0) (Node (6.5 , 7.5) Empty Empty) Empty

orderTraversal :: BTree a-> [(a,a)]
orderTraversal Empty = []
orderTraversal (Node val left right) = orderTraversal left ++ [val] ++ orderTraversal right 

checkTraversal :: (Num a, Ord a) => [(a, a)] -> Bool
checkTraversal [] = True
checkTraversal [(x,y)] = True
checkTraversal (x:y:xs) = (fst x >= fst y) && (snd x <= snd y) && checkTraversal (y:xs)

ordered :: (Num a, Ord a) =>  BTree a -> Bool
ordered  = checkTraversal . orderTraversal