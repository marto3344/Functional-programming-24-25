import Data.Char
main :: IO ()
main = do
   print $ reduceStr "dabAcCaCBAcCcaDD" == "dabCBAcaDD" 
   print $ reduceStr "aAbbC" == "bbC" --my test                                                 

reduceStr :: String -> String
reduceStr "" = ""
reduceStr (s:ss) = reverse $ helper [s] ss -- I hope the reverse function doesn't break the linear complexity 
    where helper :: String -> String -> String
          helper xs "" = xs
          helper "" (s:ss) = helper [s] ss 
          helper (x:xs) (s:ss)
            | toLower x == toLower s && x /= s  = helper xs ss
            | otherwise = helper (s:x:xs) ss
            