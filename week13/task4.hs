import Data.List(sort)
main :: IO ()
main = do
    print $ leavesAreEqual t1 t2 == True
    print $ leavesAreEqual t3 t4 == False
    print $ leavesAreEqual t4 t2 == False --my test

data BTree = Nil | Node Int BTree BTree

findLeaves :: BTree -> [Int]
findLeaves Nil = []
findLeaves (Node v Nil Nil) = [v]
findLeaves (Node v left right) = findLeaves left ++ findLeaves right

leavesAreEqual :: BTree -> BTree -> Bool
leavesAreEqual t1 t2 = (sort $ findLeaves t1) == (sort $ findLeaves t2)

t1 :: BTree
t1 = Node 10 (Node 1 Nil Nil) (Node 25 Nil (Node 30 (Node 26 Nil Nil) (Node 32 Nil Nil)))

t2 :: BTree
t2 = Node 25 (Node 10 (Node 1 Nil Nil) Nil) (Node 30 (Node 32 Nil Nil) (Node 26 Nil Nil))

t3 :: BTree
t3 = Node 10 (Node 1 Nil Nil) (Node 25 Nil (Node 30 (Node 26 Nil Nil) (Node 32 Nil Nil)))

t4 :: BTree
t4 = Node 10 (Node 1 Nil Nil) (Node 25 Nil (Node 30 (Node 27 Nil Nil) (Node 32 Nil Nil)))