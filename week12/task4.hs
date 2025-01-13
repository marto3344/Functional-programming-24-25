main :: IO ()
main = do
    print $ closestAverage [(Temp 1 23.6), (Temp 6 24.2), (Temp 11 24.2), (Temp 16 21.2), (Temp 21 23.8), (Temp 26 26.5), (Temp 31 24.5)] == 6
    print $ closestAverage [] == 0 --my test

data Measuring = Temp Int Float
    deriving (Show)

compareDays :: Measuring -> Measuring -> Float -> Measuring
compareDays (Temp d1 tmp1) (Temp d2 tmp2) avgTemp
    | abs (tmp1 - avgTemp) <= abs (tmp2 - avgTemp) = (Temp d1 tmp1)
    | otherwise = (Temp d2 tmp2)

closestAverage :: [Measuring] -> Int
closestAverage xs =  day
            where (Temp day t) = foldl (\ acc x -> compareDays acc x (averageTemp xs)) (Temp 0 0.0)  xs
                
averageTemp :: [Measuring] -> Float
averageTemp xs = (sum list)/(fromIntegral $ length list)
            where list = [temp| (Temp day temp) <- xs]
            