raindrops <- function(number) {
  rain = ""
  if (number %% 3 == 0) {
      rain <- paste(rain, "Pling", sep="")}
  if (number %% 5 == 0) {
      rain <- paste(rain, "Plang", sep="")}
  if (number %% 7 == 0) {
      rain <- paste(rain, "Plong", sep="")}
  if (rain == "") {
      rain <- as.character(number)}
  rain
}
