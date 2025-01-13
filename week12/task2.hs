main :: IO ()
main = do
    print $ highestCapital [(Country "Bulgaria" "Sofia" [(City "Varna" 0 16), (City "Plovdiv" 120 14), (City "Sofia" 420 13)]), (Country "Germany" "Berlin" [(City "Munchen" 200 15), (City "Berlin" 150 12), (City "Ulm" 210 15)]), (Country "France" "Paris" [(City "Paris" 180 15), (City "Nice" 0 14), (City "Lyon" 500 13)])]  == "Bulgaria"
    print $ highestCapital [] == "" --my test

type Name = String
type Capital = Name
type AvgYearlyTemperature = Double
type Elevation = Int
data City = City Name Elevation AvgYearlyTemperature
data Country = Country Name Capital [City]

compareEval :: (Name, Elevation) -> (Name, Elevation) -> (Name, Elevation)
compareEval (name1, elev1) (name2, elev2)
 | elev1 >= elev2 = (name1, elev1)
 | otherwise = (name2, elev2)

highestCapital :: [Country] -> Name
highestCapital xs = fst $ foldl compareEval ("", 0) [ (countryName, elev) | (Country countryName capitalName cities) <- xs, (City name elev avgTemp) <- cities, capitalName == name] 