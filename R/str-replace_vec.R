#' String replace multiple strings
#' 
#' String replace multiple strings in a vector. 
#'
#' `str_replace_vec()` is a vectorized form of [`stringr::str_replace()`].
#' 
#' This is different from passing a named vector to [`stringr::str_replace_all`], 
#' which performs multiple replacements but to all pattern matches in a string.
#' 
#' @param replace A character vector where the names are the patterns to look
#' for and the values are the replacement values `(c(pattern1 = replacement1))`
#' @inherit stringr::str_replace
#' @seealso [`stringr::str_replace()`] and [`stringr::str_replace_all()`]
#' @export
#' @examples 
#' fruits <- c("two apples", "nine pears")
#' str_replace_vec(fruits, c("two" = "three", "nine" = "ten"))

str_replace_vec <- function(string, replace) {
  chk_character(string)
  chk_character(replace)
  chk_named(replace)

  if(!length(replace)) return(string)

  pattern <- names(replace)
  
  n <- length(replace)
  
  for(i in seq_len(n)) {
    string <- stringr::str_replace(string, pattern = pattern[i], replacement = replace[i])
  }
  string
}