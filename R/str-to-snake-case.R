#' String to Snake Case
#'
#' @param x input string or mutliple strings to be converted to snake case
#'
#' @return string or strings converted to snake_case
#' @export
#'
#' @examples
#'input <- "string of words"
#'output <- str_to_snake_case(input)
#'print(output)
#' 
#'input <- "StringOfWords"
#'output <- str_to_snake_case(input)
#'print(output)
#' 
#'input <- "s!t$ring of %char^&act*ers"
#'output <- str_to_snake_case(input)
#'print(output)
#' 
#'input <- c("list of strings", "strings in a list", "many strings in a list")
#'output <- str_to_snake_case(input)
#'print(output)
#' 
str_to_snake_case <- function(x) {
  snake_case_string <- gsub("[^A-Za-z0-9_ ]", "", x)
  snake_case_string <- gsub(" ", "_", tolower(gsub("(.)([A-Z])", "\\1 \\2", snake_case_string)))
  snake_case_string <- gsub("_$", "", snake_case_string)
  snake_case_string <- gsub("^_", "", snake_case_string)
  return(snake_case_string)
}
