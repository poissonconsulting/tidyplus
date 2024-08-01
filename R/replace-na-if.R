#' Conditional replacement of NAs with specified values
#'
#' Unlike [`tidyr::replace_na()`], it is only defined for vectors.
#'
#' `replace_na_if()` is a wrapper on `if_else2(is.na(x) & condition, true, x)`
#'
#' @param x Vector with missing values to modify.
#' @param true The replacement values where condition is `TRUE`.
#' @inherit if_else2
#' @return A modified version of x that replaces any missing values where condition is `TRUE`
#' with `true`.
#' @seealso [`tidyr::replace_na()`] and [`if_else2()`]
#' @export
#' @examples
#' data <- tibble::tibble(
#'   x = c(TRUE, FALSE, NA),
#'   y = c("x is false", NA, "x is false")
#' )
#'
#' dplyr::mutate(data,
#'   x1 = tidyr::replace_na(x, FALSE),
#'   x3 = if_else2(is.na(x) & y == "x is false", FALSE, x),
#'   x4 = replace_na_if(x, y == "x is false", FALSE)
#' )
replace_na_if <- function(x, condition, true) {
  if_else2(is.na(x) & condition, true, x)
}
