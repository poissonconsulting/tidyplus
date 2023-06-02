#' Title
#'
#' @param x input string to be converted to snake case
#'
#' @return
#' @export
#'
#' @examples
#' 
str_to_snake_case <- function(x) {
  #snake_case_string <- gsub('[^[:alnum:] ]','',x) #remove special characters
  snake_case_string <- gsub("[^A-Za-z0-9_ ]", "", x)
  snake_case_string <- gsub("\\s", "_", tolower(x)) #replace spaces and make lower
  return(snake_case_string)
}
