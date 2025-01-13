main :: IO ()
main = do
    print $ convert tree == (Node 30 (Node 36 (Node 36 Nil Nil) (Node 35 Nil (Node 33 Nil Nil))) (Node 21 (Node 26 Nil Nil) (Node 15 Nil (Node 8 Nil Nil))))
    print $ convert secondTree == Node 20 (Node 23 Nil Nil) (Node 8 (Node 15 Nil Nil) Nil) --my test

data BTree = Nil | Node Int BTree BTree
    deriving (Eq)

inOrderTraversal :: BTree -> [Int]
inOrderTraversal Nil = []
inOrderTraversal (Node v left right) = inOrderTraversal left ++ [v] ++ inOrderTraversal right 

convert :: BTree -> BTree
convert bst = helper bst (inOrderTraversal bst)
        where helper :: BTree -> [Int] -> BTree
              helper Nil _ = Nil
              helper (Node v left right) xs = (Node (sum [x| x <- xs, x >= v]) (helper left xs ) (helper right xs))

tree :: BTree
tree = Node 4 (Node 1 (Node 0 Nil Nil) (Node 2 Nil (Node 3 Nil Nil))) (Node 6 (Node 5 Nil Nil) (Node 7 Nil  (Node 8 Nil Nil)))

secondTree :: BTree
secondTree = Node 5 (Node 3 Nil Nil) (Node 8 (Node 7 Nil Nil) Nil)