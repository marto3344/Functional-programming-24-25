import Data.List
main :: IO ()
main = do
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 0 1 == [[1]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 1 == [[1, 2], [1, 3]]
    print $ simplePaths [(1, [2, 3, 4]), (2, [3, 4]), (3, []), (4, [])] 1 1 == [[1,2],[1,3],[1,4]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 2 1 == [[1, 2, 3], [1, 2, 4]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 2 == [[2,3],[2,4]]
    print $ simplePaths [(1, [2, 3]), (2, [3]), (3, []), (4, [])] 1 2 == [[2,3]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, [4]), (4, [])] 3 1 == [[1, 2, 3, 4]] --my test

type Node = Int
type Graph = [(Node, [Node])]
type Path = [Node]


simplePaths :: Graph -> Int -> Node -> [Path]
simplePaths _ 0 v = [[v]]
simplePaths g n v =  [v:path | neighbour <- neighbours , path <- simplePaths g (n - 1) neighbour ]
        where (node, neighbours) = head $ filter (\(val, _) -> val == v) g 