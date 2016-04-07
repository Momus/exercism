module Leap (..) where


isLeapYear : Int -> Bool
isLeapYear year =
  if      (year % 400) == 0 then True
  else if (year % 100) == 0 then False
  else if (year % 4)   == 0 then True
  else False
