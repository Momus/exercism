raindrops <- function(number) {
  rain = ""
  if (number %% 3 == 0){
    paste(rain, "Pling", sep="")}
  else if (number %% 5 == 0) {
    paste(rain, "Plang", sep="")}
  else if (number %% 7 == 0) {
    paste(rain, "Plong", sep="")
  }
  else 
    as.character(number)
  #"Pling"
}
