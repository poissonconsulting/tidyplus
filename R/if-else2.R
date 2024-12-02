#' Vectorised if else.
#'
#' Vectorised if else that if true returns first possibility otherwise returns
#' second possibility (even if the condition is a missing value).
#' When searching character vectors an alternative solution is to use
#' [`str_detect2()`].
#'
#' @inherit dplyr::if_else
#' @param error A logical value. If `TRUE`, provides an informative error message if no matches are found. 
#' @return Where condition is `TRUE`, the matching value from `true`, where it's `FALSE` or `NA`, the matching value from `false`.
#' @seealso [`ifelse()`] and [`dplyr::if_else()`].
#' @export
#' @examples
#' # consider the following data frame
#' data <- tibble::tibble(
#'   x = c(TRUE, FALSE, NA),
#'   y = c("x is false", NA, "hello")
#' )
#'
#' # with a single vector if_else2() behaves the same as the default call to if_else().
#' dplyr::mutate(data,
#'   y1 = dplyr::if_else(y != "x is false", "x is true", y),
#'   y2 = if_else2(y != "x is false", "x is true", y)
#' )
#'
#' # however in the case of a second vector the use of
#' # if_else2() does not introduce missing values
#' dplyr::mutate(data,
#'   x1 = dplyr::if_else(stringr::str_detect(y, "x is false"), FALSE, x),
#'   x2 = if_else2(stringr::str_detect(y, "x is false"), FALSE, x)
#' )
#'
#' # in the case of regular expression matching an alternative is to use
#' # str_detect2()
#' dplyr::mutate(data,
#'   x3 = dplyr::if_else(str_detect2(y, "x is false"), FALSE, x)
#' )
if_else2 <- function(condition, true, false, error = FALSE) {
	chk_flag(error)
  if (!any(condition) & error == TRUE) {
    stop("No matches found. Did not make any replacements.")
  }
  dplyr::if_else(condition, true, false, missing = false)
}
