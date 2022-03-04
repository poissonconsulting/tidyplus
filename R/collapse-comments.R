#' Collapse Comments
#' 
#' Collapse comments by concatenating, coercing to string
#' and then collapsing into a single string (character scalar) 
#' using the '. ' separator.
#'
#' @param ... objects to be collapsed into a string.
#' @export
#' @examples
#' collapse_comments(c("Saw fish"), character(0), "Nice. .", NA_character_)
collapse_comments <- function(...) {
  x <- c(...)
  x <- as.character(x)
  if(length(x) == 0) return(character(0))
  x <- x[!is.na(x)]
  x <- stringr::str_replace(x, "(\\.\\s*)+$", "")
  x <- stringr::str_squish(x)
  x <- x[nchar(x) > 0]
  if(length(x) == 0) return("")
  sep <- ". "
  x <- paste(x, sep = sep, collapse = sep)
  paste(x, "", sep = ".")
}
