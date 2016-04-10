module Raindrops (..) where


addDrop : Int -> Int -> String -> String -> String
addDrop input test rainDrop resultString =
  if (input % test == 0) then
    resultString ++ rainDrop
  else
    resultString


cascade : Int -> String
cascade number =
  ""
    |> addDrop number 3 "Pling"
    |> addDrop number 5 "Plang"
    |> addDrop number 7 "Plong"


raindrops : Int -> String
raindrops number =
  if cascade number == "" then
    toString number
  else
    cascade number
