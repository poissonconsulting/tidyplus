#' Find duplicate rows in a data frame
#'
#' Finds duplicate rows within a data frame. Column names can optionally be
#' provided. If column names aren't provided, the entire data frame (all
#' columns) will be searched for duplicate rows. If column names are provided,
#' only the specified columns will be searched for duplicate rows.
#' 
#' @param x A data.frame.
#' @param cols A character vector of the column names.
#' @return A tibble containing only duplicate rows.
#' @export
duplicates <- function(x, cols = colnames(x)) {
  check_data(x)
  chk_vector(cols)
  check_values(cols, "")
  check_names(x, cols)
  
  x <- tibble::as_tibble(x)
  
  cols <- unique(cols)
  
  if (!length(cols)) {
    return(x)
  }
  
  y <- x[cols]
  y <- y[duplicated(y), , drop = FALSE]
  y <- unique(y)
  x <- merge(x, y, by = cols)
  x <- dplyr::as_tibble(x)
  x
}
