module Bob exposing (..)

import String exposing (toUpper, endsWith)
import Regex exposing (regex)


hey : String -> String
hey query =
    if silence query then
        "Fine. Be that way!"
    else if shouting query then
        "Whoa, chill out!"
    else if endsWith "?" query then
        "Sure."
    else
        "Whatever."


silence : String -> Bool
silence query =
    query
        |> Regex.contains (regex "^\\s*$")


shouting : String -> Bool
shouting query =
    (toUpper query == query)
        && (query
                |> Regex.contains (regex "[A-z]+")
           )
