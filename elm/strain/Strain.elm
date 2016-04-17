module Strain (..) where
import List

keep : (a -> Bool) -> List a -> List a
keep function list =
  List.filter function list


discard : (a -> Bool) -> List a -> List a
discard function list =
  List.filter function list
