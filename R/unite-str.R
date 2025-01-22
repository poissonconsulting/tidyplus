#' Unite multiple character columns into one
#'
#' Convenience function for combining character columns.
#'
#' Blank values of "" are converted into missing values.
#'
#' @inherit tidyr::unite
#' @return The original data frame with the one or more columns combined as
#' character vectors separated by a period.
#'
#' @seealso [`tidyr::unite()`] and [`collapse_comments()`]
#' @export
#' @examples
#' data <- tibble::tibble(x = c("good", "Saw fish.", "", NA), y = c("2021", NA, NA, NA))
#'
#' # unite has poor handling of character vectors
#' tidyr::unite(data, "new", x, y, remove = FALSE)
#'
#' unite_str(data, "new", x, y, remove = FALSE)
unite_str <- function(data, col, ..., sep = ". ", remove = TRUE) {
  col <- rlang::ensym(col) 
  if (rlang::dots_n(...) == 0) {
    from_vars <- rlang::set_names(seq_along(data), names(data))
  } else {
    from_vars <- tidyselect::eval_select(rlang::expr(c(...)), data)
  }
  data <- dplyr::mutate(data, dplyr::across(tidyselect::all_of(from_vars), as.character))
  data <- dplyr::mutate(data, dplyr::across(tidyselect::all_of(from_vars), na_if_blank))
  data <- tidyr::unite(data, col = !!col, ..., sep = sep, remove = remove, na.rm = TRUE)
  data <- dplyr::mutate(data, dplyr::across(tidyselect::all_of(rlang::as_string(col)), na_if_blank))
  data
}
