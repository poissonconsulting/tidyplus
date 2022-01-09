#' Vectorised if else.
#' 
#' Vectorised if else that if true returns first possibility otherwise returns
#' second possibility (even if the condition is a missing value).
#' 
#' @inherit dplyr::if_else
#' @return Where condition is `TRUE`, the matching value from `true`, where it's `FALSE` or `NA`, the matching value from `false`.
#' @seealso [`ifelse()`] and [`dplyr::if_else()`].
#' @export
#' @examples 
#' # consider the following data frame
#' data <- tibble::tibble(
#'   x = c(TRUE, FALSE, NA), 
#'   y = c("x is false", NA, "hello"))
#'   
#' # with a single vector if_else2 behaves the same as the default call to if_else.
#' dplyr::mutate(data,
#'     y1 = dplyr::if_else(y != "x is false", "x is true", y),
#'     y2 = dplyr::if_else(y != "x is false", "x is true", y))
#' 
#' # however in the case of a second vector if_else2 does not introduce missing values
#' dplyr::mutate(data,
#'     x1 = dplyr::if_else(y == "x is false", FALSE, x),
#'     x2 = if_else2(y == "x is false", FALSE, x))
if_else2 <- function(condition, true, false) {
  dplyr::if_else(condition, true, false, missing = false)
}