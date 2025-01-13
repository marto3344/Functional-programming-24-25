main :: IO ()
main = do
    print $ levelSum numberBTree 1 == 11 
    print $ levelSum myTree 2 == 25 --my test

    print $ cone numberBTree == True 
    print $ cone myTree == False --my test 

data BTree = Nil | Node Int BTree BTree

getLevel :: BTree -> Int -> [Int]
getLevel Nil _ = []
getLevel (Node v _ _) 0 = [v]
getLevel (Node v left right) n = getLevel left (n - 1) ++ getLevel right (n - 1)

levelSum :: BTree -> Int -> Int
levelSum t k = sum $ getLevel t k

cone :: BTree -> Bool
cone Nil = True
cone t = helper 0 1
    where 
        helper :: Int -> Int -> Bool
        helper  curr next  = (null (getLevel  t next)) || ((levelSum t curr) < (levelSum t next) && helper next (next + 1))
           
numberBTree :: BTree
numberBTree = Node 10 (Node 5 (Node 1 Nil Nil) (Node 9 Nil Nil)) (Node 6 (Node 8 Nil Nil) (Node 7 Nil Nil))

myTree :: BTree
myTree = Node 100 (Node 18 (Node 1 Nil Nil) (Node 9 Nil Nil)) (Node 6 (Node 8 Nil Nil) (Node 7 Nil Nil))