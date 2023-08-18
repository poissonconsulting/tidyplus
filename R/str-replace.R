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
# 
str_replace_when <- function(x, replace = list()) {
  chk_list(replace)
  
  if(!length(replace)) return(x)
  if(!ncol(x)) return(x)
  
  chk_named(replace)
  chk_all(replace, chk_character)
  chk_all(replace, check_dim, values = TRUE)
  chk_all(replace, chk_not_any_na)
  
  for(i in seq_along(replace)) {
    x <- replace_strings(x, replace[i])
  }
  x
}

replace_strings <- function(x, replace, default) {
  string <- names(replace)
  string <- unique(string)
  
  string <- string[string %in% names(x)]
  
  str_match <- names(x) %in% string
  
  if(!any(str_match)) {
    print(x)
    return(x)
  }
  
  for(i in string) {
    values <- replace[i]
    values <- unlist(values)
    values <- unname(values)
    pattern <- values[values %in% x[[i]]]
    replacement <- values[!values %in% x[[i]]]
    x[i] <- gsub(pattern, replacement, x[[i]])
    x[i] <- x[i]
    x
  }
  x
}

# 
# x <- data.frame(chemical = c("SO4", "A"),
#                 fruit = c("apples", "banana")) 
# 
# replace <- list(chemical = c("SO4", "SO5"), 
#                 chemical = c("A", "B"))
# 
# replace_strings(x, replace)
# 
# x <-  mutate(x, chemical = str_replace_when(list(chemical = c("SO4", "SO5"), 
#                                                chemical = c("A", "B"))))
