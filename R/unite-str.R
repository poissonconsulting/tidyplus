#' Unite multiple character columns into one
#' 
#' Convenience function for combining character columns.
#' 
#' Blank values of "" are converted into missing values.
#' 
#' @inherit tidyr::unite
#' @seealso [`tidyr::unite()`]
#' @export
#' @examples 
#' data <- tibble::tibble(x = c("good", "Saw fish.", "", NA), y = c("2021", NA, NA, NA))
#' tidyr::unite(data, "new", x, y, remove = FALSE)
#' unite_str(data, "new", x, y, remove = FALSE)
unite_str <- function (data, col, ..., sep = ". ", remove = TRUE) 
{
  if (rlang::dots_n(...) == 0) {
    from_vars <- rlang::set_names(seq_along(data), names(data))
  }
  else {
    from_vars <- tidyselect::eval_select(rlang::expr(c(...)), data)
  }
  data <- dplyr::mutate(data, dplyr::across(tidyselect::all_of(from_vars), na_if_blank))
  data <- tidyr::unite(data, col = !!col, ..., sep = sep, remove = remove, na.rm = TRUE)
  data <- dplyr::mutate(data, dplyr::across(tidyselect::all_of(col), na_if_blank))
  data
}

na_if_blank <- function(x) {
  dplyr::na_if(x, "")
}