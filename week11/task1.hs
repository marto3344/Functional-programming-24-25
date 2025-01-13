main :: IO ()
main = do
    print $ height numberBTree == 4
    print $ height charBTree == 3
    print $ height myTree == 2 --my test

    print $ average numberBTree == 16.22
    print $ average myTree == 2.0
    --print $ average charBTree -- should not work

    print $ sumLeaves numberBTree == 119
    print $ sumLeaves myTree == 5 --my test
    -- print $ sumLeaves charBTree -- shouldn't work

    print $ areEqual numberBTree (Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil Nil))) == False
    print $ areEqual charBTree charBTree == True
    print $ areEqual numberBTree (Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 8 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil)))) == False
    print $ areEqual myTree numberBTree == False --my test

    print $ setLevels numberBTree == Node (0,5) (Node (1,12) (Node (2,1) (Node (3,96) Nil Nil) Nil) (Node (2,0) Nil Nil)) (Node (1,4) (Node (2,2) Nil Nil) (Node (2,5) Nil (Node (3,21) Nil Nil)))
    print $ setLevels charBTree == Node (0,'k') (Node (1,'a') (Node (2,'h') Nil Nil) (Node (2,'s') Nil Nil)) (Node (1,'l') (Node (2,'e') Nil Nil) (Node (2,'l') Nil Nil))
    print $ setLevels myTree == Node (0 ,1) (Node (1, 2) Nil Nil) (Node (1,3) Nil Nil) --my test

    print $ mirrorTree numberBTree == Node 5 (Node 4 (Node 5 (Node 21 Nil Nil) Nil) (Node 2 Nil Nil)) (Node 12 (Node 0 Nil Nil) (Node 1 Nil (Node 96 Nil Nil)))
    print $ mirrorTree charBTree == Node 'k' (Node 'l' (Node 'l' Nil Nil) (Node 'e' Nil Nil)) (Node 'a' (Node 's' Nil Nil) (Node 'h' Nil Nil))
    print $ mirrorTree myTree == Node 1 (Node 3 Nil Nil) (Node 2 Nil Nil) --my test
    

height :: BTree a -> Int
height Nil = 0;
height (Node v left right) = 1 + max (height left) (height right)

size :: BTree a -> Int
size Nil = 0
size (Node _ left right) = 1 + size left + size right

sumTree :: (Num a) => BTree a -> a
sumTree Nil = 0
sumTree (Node value left right) = value + sumTree left + sumTree right

average :: (Num a, Integral a) => BTree a -> Double
average Nil = 0
average tree =   (fromIntegral $ round (avg * 100))/100
    where avg = (fromIntegral $ sumTree tree) / (fromIntegral $ size tree)


sumLeaves :: (Num a)=> BTree a -> a
sumLeaves Nil = 0
sumLeaves (Node value Nil Nil) = value 
sumLeaves (Node _ left right) = sumLeaves left + sumLeaves right

traverseDFS :: BTree a -> [a]
traverseDFS Nil = []
traverseDFS (Node value left right) = traverseDFS left ++ [value] ++ traverseDFS right

areEqual :: (Eq a) => BTree a -> BTree a -> Bool
areEqual t1 t2 = traverseDFS t1 == traverseDFS t2

setRec :: BTree a ->Int -> BTree (Int, a)
setRec Nil _ = Nil
setRec (Node v left right) level = Node (level, v) (setRec left (level + 1)) (setRec right (level + 1))

setLevels :: BTree a -> BTree (Int, a)
setLevels t = setRec t 0

mirrorTree :: BTree a -> BTree a
mirrorTree Nil = Nil
mirrorTree (Node v left right) = Node v  (mirrorTree right) (mirrorTree left)

data BTree a = Nil | Node a (BTree a) (BTree a)
 deriving (Show, Eq)

charBTree :: BTree Char
charBTree = Node 'k' (Node 'a' (Node 'h' Nil Nil) (Node 's' Nil Nil)) (Node 'l' (Node 'e' Nil Nil) (Node 'l' Nil Nil))

numberBTree :: BTree Int
numberBTree = Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil)))

myTree :: BTree Int
myTree = Node 1 (Node 2 Nil Nil) (Node 3 Nil Nil)