#' Converts strings to Snake Case
#'
#' @param x input string or multiple strings to be converted to snake case
#'
#' @return string or strings converted to snake_case
#' @export
#'
#' @examples
#str_to_snake_case("string of words")
#'
#'output <- str_to_snake_case("StringOfWords")
#' 
#'output <- str_to_snake_case("s!t$ring of %char^&act*ers")
#' 
#str_to_snake_case(c("multiples of strings", "strings in a multiples", "many strings"))
#' 
str_to_snake_case <- function(x) {
  snake_case_string <- gsub("[^A-Za-z0-9_ ]", "", x)
  snake_case_string <- gsub(" ", "_", tolower(gsub("(.)([A-Z])", "\\1 \\2", snake_case_string)))
  snake_case_string <- gsub("_$", "", snake_case_string)
  snake_case_string <- gsub("^_", "", snake_case_string)
  return(snake_case_string)
}
