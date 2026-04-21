#' Converts strings to Snake Case
#'
#' @param x input string or multiple strings to be converted to snake case
#'
#' @return string or strings converted to snake_case
#' @export
#'
#' @examples
#' str_to_snake_case("string of words")
#'
#' str_to_snake_case("StringOfWords")
#'
#' str_to_snake_case("s!t$ring of %char^&act*ers")
#'
#' str_to_snake_case(c("multiples of strings", "strings in multiple", "many strings"))
#'
str_to_snake_case <- function(x) {
  snake_case_string <- trimws(x)
  snake_case_string <- gsub("[^A-Za-z0-9_ ]", "", snake_case_string)
  snake_case_string <- gsub("\\s+", " ", snake_case_string)
  snake_case_string <- gsub(" ", "_", tolower(gsub("([a-z])([A-Z])", "\\1_\\2", snake_case_string)))
  snake_case_string <- gsub("_+", "_", snake_case_string)
  snake_case_string <- gsub("^_|_$", "", snake_case_string)
  snake_case_string
}
