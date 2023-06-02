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
  snake_case_string <- gsub("[^A-Za-z0-9_ ]", "", x)
  snake_case_string <- gsub(" ", "_", tolower(gsub("(.)([A-Z])", "\\1 \\2", snake_case_string)))
  snake_case_string <- gsub("[_$]", "", snake_case_string)
  snake_case_string <- gsub("^_", "", snake_case_string)
  return(snake_case_string)
}
