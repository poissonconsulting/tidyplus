#' @description
#' Vectorised over `string` and `pattern`. 
#' 
#' @inherit stringr::str_replace
#' @seealso [`grepl()`] and [`stringr::str_replace()`]
#' @export
#' @examples 
#' x <- c("b", NA, "ab")
#' pattern <- "^a"
#' grepl(pattern, x)
#' stringr::str_detect(x, pattern)
#' str_detect2(x, pattern)
# mutate(chemical = str_replace_when(
#   list(chemical = c("\\-Total$", ""),
#        chemical = c("\\-SO4", "(SO4)"),
#        chemical = TRUE))

str_replace_many <- function(string, replace) {
  chk_character(replace)
  chk_character(string)
  chk_named(replace)
  
  if(!length(replace)) return(x)

  string <- string[string %in% names(x)]
  
  str_match <- names(x) %in% string
  
  if(!any(str_match)) {
    print(x)
    return(x)
  }
  
  pattern <- names(replace)
  
  for(i in seq_along(pattern)) {
    replacement <- replace[i]
    replacement <- unname(replacement)
    print(replacement)
    pattern_match <- i %in% x[[string]]
    print(pattern_match)
    if(any(pattern_match)) {
      x[string] <- gsub(i, replacement, string)
    }
  }
  x
}

x <- data.frame(chemical = c("SO4", "A"),
                fruit = c("apples", "banana"))


chemical2 <- dplyr::mutate(x, chemical = str_replace_many(chemical, replace = c("SO4" = "SO5",
                                                                      "A" = "B")))

