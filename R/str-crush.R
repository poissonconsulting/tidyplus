#' Remove whitespace from a string
#' 
#' `str_crush()`, which removes all whitespace from a string,
#' is the logical extension to [`stringr::str_trim()`] and [`stringr::str_squish()`].
#' 
#' `str_crush()` is considered [too specialized](https://github.com/tidyverse/stringr/pull/338) to be part of stringr.
#' 
#' @inherit stringr::str_squish
#' @seealso [`stringr::str_trim()`] and [`stringr::str_squish()`]
#' @export
#' @examples 
#' str_crush("  String with trailing,  middle, and leading white space\t")
str_crush <- function (string) 
{
  stringi::stri_trim_both(stringr::str_replace_all(string, "\\s+", ""))
}
