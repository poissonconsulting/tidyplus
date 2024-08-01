#' Drop rows containing all missing values
#'
#' This is a convenient way to drop uninformative rows from a data frame.
#'
#' @inheritParams tidyr::drop_na
#' @return The original data frame with rows for which all values are missing dropped.
#' @seealso [`tidyr::drop_na`] and [`drop_uninformative_columns`]
#' @export
#' @examples
# drop_na_all
#' data <- tibble::tibble(
#'   a = c(NA, NA, NA), b = c(1, 1, NA), c = c(2, NA, NA)
#' )
#'
#' drop_na_all(data)
#' drop_na_all(data, a, c)
drop_na_all <- function(data, ...) {
  rlang::check_dots_unnamed()
  UseMethod("drop_na_all")
}

#' @export
drop_na_all.data.frame <- function(data, ...) {
  dots <- rlang::enquos(...)

  if (rlang::is_empty(dots)) {
    cols <- data
  } else {
    vars <- tidyselect::eval_select(rlang::expr(c(!!!dots)), data)
    cols <- data[vars]
  }

  keep <- which(!vctrs::vec_detect_missing(cols))
  dplyr::slice(data, keep)
}
