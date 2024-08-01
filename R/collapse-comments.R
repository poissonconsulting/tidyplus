#' Collapse Comments
#'
#' Collapse comments coercing each element to a string (character scalar)
#' and then collapsing into a single string using the '. ' separator.
#'
#' @param ... objects to be collapsed into a string.
#' @return A string of the collapsed comments.
#' @seealso [`unite_str()`]
#' @export
#' @examples
#' collapse_comments("Saw fish", character(0), "Nice. .", NA_character_)
#'
#' data <- data.frame(
#'   visit = c(1, 1, 2, 2),
#'   fish = 1:4,
#'   comment = c("Sunny day.  ", "Skinny fish", "Lost boot", NA)
#' )
#'
#' \dontrun{
#' data |>
#'   dplyr::group_by(visit) |>
#'   dplyr::summarise(comment = collapse_comments(comment)) |>
#'   dplyr::ungroup()
#' }
collapse_comments <- function(...) {
  x <- c(...)
  x <- as.character(x)
  if (length(x) == 0) return(character(0))
  x <- x[!is.na(x)]
  x <- stringr::str_replace(x, "(\\.\\s*)+$", "")
  x <- stringr::str_squish(x)
  x <- x[nchar(x) > 0]
  if (length(x) == 0) return("")
  sep <- ". "
  x <- paste(x, sep = sep, collapse = sep)
  paste(x, "", sep = ".")
}
