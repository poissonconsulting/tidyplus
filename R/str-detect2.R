#' @description
#' Vectorised over `string` and `pattern`. 
#' Actually equivalent to `grepl(pattern, x)` as returns FALSE 
#' for `NA`s (unlike [`stringr::str_detect()`]).
#' This behavior is useful when searching comments many of which are NA to 
#' indicate no comments present.
#' 
#' @inherit stringr::str_detect
#' @seealso [`grepl()`] and [`stringr::str_detect()`]
#' @export
#' @examples 
#' x <- c("b", NA, "ab")
#' pattern <- "^a"
#' grepl(pattern, x)
#' stringr::str_detect(x, pattern)
#' str_detect2(x, pattern)
str_detect2 <- function (string, pattern, negate = FALSE) 
{
  chk_flag(negate)
  x <- stringr::str_detect(string, pattern, negate = negate)
  x[is.na(x)] <- negate
  x
}
