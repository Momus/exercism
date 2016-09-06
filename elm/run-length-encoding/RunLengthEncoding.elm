module RunLengthEncoding exposing (version, encode, decode)
 
import String as S


version: Int
version =
  2


encode: String -> String
encode text =
  tailEncode text "" 'a'


decode: String -> String
decode rlEncoded =
  "AABBBCCCC"


tailEncode : String -> String -> Char -> String
tailEncode inString outString oldChar =
  let
    stringTuple = S.uncons inString
                  
  in
    case stringTuple of
      Nothing ->
        outString
          
      Just (c,rest) ->
        let
          nextCharAsStr = S.left 1 rest

        in
          case nextCharAsStr of
            "" -> if c == oldChar
                  then incrementOutString c outString True
                  else outString ++ (S.fromChar c)
                       
            _ ->
              if c == oldChar
              then tailEncode rest (incrementOutString c outString False) c
              else tailEncode rest (outString ++ (justTheChar c)) c


                      
incrementOutString : Char -> String -> Bool-> String
incrementOutString c inString charAppend =
-- takes a string, strips out the number from the end, increments it
-- by 1, puts that back followed by the charecter.

-- If charAppend is true, stick on the charecter, c, passed to it.
  let
    inTuple =
      crawlEndOfStringForInt inString -1 1

    stringsInt =
      Basics.fst inTuple

    restString =
      Basics.snd inTuple

    finalChar =
      case charAppend of
        True ->
          (justTheChar c)

        False ->
            ""

  in
    if stringsInt  < 0 then
      restString ++ finalChar

   else
     restString ++ toString (stringsInt + 1) ++ finalChar
                  
  
crawlEndOfStringForInt : String -> Int -> Int -> ( Int, String )
crawlEndOfStringForInt string lastNum nextPosition =
  -- Returns a tuple of integer representation of the number at the
  -- end of the string, and the rest of the string without the number.
  
  -- if there's no number in the end of the string, will return
  -- whatever lastNum it was called with. Call with any negative Int
  -- to test if there was a number found, since it can only detect
  -- positive numbers.

  -- nextPostion determines how far up the string the search
  -- starts. Calling with something other than 1 is rarely useful
  let
    testString =
      S.right nextPosition string
            
    restString =
      S.dropRight (nextPosition - 1) string
  in
    case S.toInt(testString) of
      Err msg ->
        (lastNum, restString)

      Ok newNum ->
        crawlEndOfStringForInt string newNum (nextPosition + 1)                

                               
justTheChar : Char -> String
justTheChar c =
-- Strips of the annoying ' when converting Char to a String.
 S.slice 1 2 (toString c)
