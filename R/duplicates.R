#' Duplicates
#'
#' @param x A data.frame.
#' @param cols A character vector of the column names.
#' @return A tibble with just the duplicate rows included.
#' @export
duplicates <- function(x, cols = colnames(x)) {
  check_data(x)
  chk_vector(cols)
  check_values(cols, "")
  check_names(x, cols)
  
  x %<>% tibble::as_tibble()
  
  cols %<>% unique()
  
  if (!length(cols)) {
    return(x)
  }
  
  y <- x[cols]
  y <- y[duplicated(y), , drop = FALSE] %>%
    unique()
  x %<>% merge(y, by = cols)
  x %<>% dplyr::as_tibble()
  x
}
