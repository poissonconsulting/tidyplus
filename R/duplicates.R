#' Keep non-unique rows in a data frame
#'
#' Keeps only non-unique rows within a data frame.
#'
#' @param .data A data.frame.
#' @param ... Optional variables to use when determining non-uniqueness.
#'  If omitted, will use all variables in the data frame.
#' @param .keep_all A flag specifying whether to keep all variables in .data.
#' @return The original data frame with only non-unique rows.
#' @export
#' @examples
#' data <- tibble::tibble(x = c(1, 2, 1, 1), y = c(1, 1, 1, 5))
#'
#' duplicates(data)
#' duplicates(data, x)
#' duplicates(data, y)
#' duplicates(data, x, y)
#' duplicates(data, y, .keep_all = FALSE)
duplicates <- function(.data, ..., .keep_all = TRUE) {
  check_data(.data)
  chk_flag(.keep_all)

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

  grouped <- dplyr::is_grouped_df(.data)
  groups <- dplyr::group_vars(.data)
  groups_sym <- rlang::syms(groups)

  is_sf <- any(class(.data) == "sf")
  if (is_sf) {
    rlang::check_installed("sf", reason = "to preserve sf objects.")
    col_name_sf <- attributes(.data)$sf_column
  }

  .data <- tibble::as_tibble(.data)

  .data_dup <- dplyr::select(.data, dplyr::all_of(col_names))
  .data_dup <- .data_dup[duplicated(.data_dup), , drop = FALSE]
  .data_dup <- unique(.data_dup)

  .data <- dplyr::inner_join(.data, .data_dup, by = col_names)
  if (!(.keep_all)) {
    .data <- dplyr::select(.data, dplyr::all_of(col_names))
  }
  if (grouped) {
    .data <- dplyr::group_by(.data, !!!groups_sym)
  }
  if (is_sf) {
    .data <- sf::st_as_sf(.data, sf_column_name = col_name_sf)
  }
  .data
}
