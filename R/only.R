#' Extract the only distinct value from a vector
#' 
#' Extracts the only distinct value from an atomic vector 
#' or throws an informative error if no values or multiple distinct values.
#' 
#' `only()` is useful when summarizing a vector by group 
#' while checking the assumption that it is constant within the group.
#' 
#' @param x  An atomic vector.
#' @param na_rm A flag indicating whether to exclude missing values.
#' @seealso [`dplyr::first()`]
#' @return The only value from a vector.
#' @export
#' @examples
#' only(c(1, 1))
#' only(c(NA, NA))
#' only(c(1, 1, NA), na_rm = TRUE)
#' try(only(character(0)))
#' try(only(c(1, NA)))
#' try(only(c(1, 2)))
only <- function(x, na_rm = FALSE) {
  chk_vector(x)
  chk_atomic(x)
  chk_flag(na_rm)
  
  if(length(x) == 0) {
    rlang::abort("`x` must have at least 1 element.")
  }

  if(na_rm) {
    x <- x[!is.na(x)]
    if(length(x) == 0) {
      rlang::abort("`x` must have at least 1 non-missing element.")
    }
  }

  if(length(unique(x)) != 1) {
    rlang::abort("`x` must only have 1 distinct value.")
  }
  
  x[1]
}
