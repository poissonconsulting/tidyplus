#' Add missing columns to a data frame
#' 
#' This is a convenient way to add one more columns (if not already present) to
#' an existing data frame. It is useful to ensure that all required columns
#' are present in a data frame.
#' 
#' It is wrapper on [`tibble::add_column()`] that doesn't error if the column 
#' is already present. 
#' 
#' @inherit tibble::add_column
#' 
#' @return The original data frame with missing columns added 
#' if not already present.
#'
#' @seealso [`tibble::add_column()`]
#' @export
#' @examples 
# add_column ---------------------------------
#' data <- tibble::tibble(x = 1:3, y = 3:1)
#' 
#' tibble::add_column(data, z = -1:1, w = 0)
#' add_missing_column(data, z = -1:1, .before = "y")
#' 
#' # add_column errors if already present
#' try(tibble::add_column(data, x = 4:6))
#' 
#' # add_missing_column silently ignores
#' add_missing_column(data, x = 4:6)
add_missing_column <- function(
  .data, ..., .before = NULL, .after = NULL, 
  .name_repair = c("check_unique", "unique", "universal", "minimal")) {
  
  if(!is.data.frame(.data)) {
    stop("add_column(.data = 'must be a data frame')")
  }
  df <- tibble::tibble(..., .name_repair = .name_repair)
  if (ncol(df) == 0L) {
    return(.data)
  }
  names <- colnames(df)
  names <- names[!names %in% colnames(.data)]
  if(!length(names)) {
    return(.data)
  }
  dots <- list(...)
  tibble::add_column(.data, !!!dots, .before = .before, .after = .after,
             .name_repair = .name_repair)
}