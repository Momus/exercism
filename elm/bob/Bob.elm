module Bob where

import String
import Regex


hey: String -> String
hey query =
  if silence query
  then "Fine. Be that way!"
       
  else if shouting query
       then "Whoa, chill out!"
            
  else if String.endsWith "?" query
       then "Sure."
            
  else "Whatever."


silence : String -> Bool  --Regex.Regex
silence query =
  Regex.contains (Regex.regex "^\\s*$") query

shouting : String -> Bool
shouting query =
  (String.toUpper query == query)
    && Regex.contains (Regex.regex "[A-z]+") query
      
