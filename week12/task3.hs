main :: IO ()
main = do
    print $ maxDepthBlueNode colorTree == 2
    print $ maxDepthBlueNode secondTree == -1 --my test
    
data Color = Red | Green | Blue
    deriving (Eq)
data Tree = Empty | Node Color Tree Tree

dfs :: Int -> Tree -> Int
dfs _ Empty = -1
dfs level (Node color left right)
 | color == Blue = max level (max (dfs (level + 1) left) (dfs (level + 1) right))
 | otherwise = max (dfs (level + 1) left) (dfs (level + 1) right)

maxDepthBlueNode :: Tree -> Int
maxDepthBlueNode = dfs 0

colorTree :: Tree
colorTree = Node Blue (Node Red (Node Green Empty Empty) Empty) (Node Red (Node Blue (Node Green Empty Empty) (Node Red Empty Empty)) Empty)

secondTree :: Tree
secondTree = Node Red (Node Red (Node Green Empty Empty) Empty) (Node Red (Node Green (Node Green Empty Empty) (Node Red Empty Empty)) Empty)
