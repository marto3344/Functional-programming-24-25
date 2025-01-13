main :: IO ()
main = do
    print $ minDepthGreenNode colorTree == 2
    print $ minDepthGreenNode myColorTree == 0 --my test

data Color = Red | Green | Blue
    deriving(Eq)
data Tree = Empty | Node Color Tree Tree


colorTree :: Tree
colorTree = Node Blue (Node Red (Node Green Empty Empty) Empty) (Node Red (Node Blue (Node Green Empty Empty) (Node Red Empty Empty)) Empty)


myColorTree :: Tree
myColorTree = Node Green (Node Red (Node Green Empty Empty) Empty) (Node Red (Node Blue (Node Green Empty Empty) (Node Red Empty Empty)) Empty)

getLevel :: Tree -> Int-> [Color]
getLevel Empty _ = []
getLevel (Node v  left right) 0 = [v]
getLevel (Node v left right) k = getLevel left (k - 1) ++ getLevel right (k - 1) 

minDepthGreenNode :: Tree -> Int
minDepthGreenNode Empty = -1
minDepthGreenNode tree = helper 0 
                where helper :: Int -> Int
                      helper k
                        | null $ getLevel tree k = -1
                        | elem Green $ getLevel tree k = k
                        | otherwise = helper (k+1)
