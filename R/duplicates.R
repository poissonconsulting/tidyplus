#' Find duplicate rows in a data frame
#'
#' Finds duplicate rows within a data frame. Column names can optionally be
#' provided. If column names aren't provided, the entire data frame (all
#' columns) will be searched for duplicate rows. If column names are provided,
#' only the specified columns will be searched for duplicate rows.
#' 
#' @param .data A data.frame.
#' @param ... Optional column names to use when searching for duplicate rows in specific columns.
#' @return A tibble containing only duplicate rows.
#' @export
duplicates <- function(.data, ...) {
  check_data(.data)
  
  col <- rlang::ensyms(...)
  if (length(col) == 0) {
    col_names <- colnames(.data)
  } else {
    col_names <- vapply(col, rlang::as_string, character(1))
  }
  col_names <- unique(col_names)
  chk_vector(col_names)
  check_values(col_names, "")
  check_names(.data, col_names)
  
  if (!length(col_names)) {
    return(.data)
  }
  .data_dup <- dplyr::select(.data, dplyr::all_of(col_names))
  print(.data_dup)
  .data_dup <- .data_dup[duplicated(.data_dup), , drop = FALSE]
  print(.data_dup)
  .data_dup <- unique(.data_dup)
  print(.data_dup)
  .data <- merge(.data, .data_dup, by = col_names)
  .data <- dplyr::as_tibble(.data)
  .data
}
