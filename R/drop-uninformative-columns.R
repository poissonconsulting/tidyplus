informative_na_distinct <- function(x) length(unique(x)) == 1L
informative_na_not_distinct <- function(x) length(unique(x[!is.na(x)])) %in% 0:1

#' Drop uninformative columns from a data frame
#' 
#' This is a convenient way to drop columns which all have one value (missing or not) or 
#' if `na_distinct = FALSE` also drop columns which all have one value and/or missing values.
#' 
#' @param data A data frame.
#' @param na_distinct A flag specifing whether to treat missing values 
#' as distinct from other values.
#' @export
#' @examples 
# drop_uninformative_columns ---------------------------------
#' data <- tibble::tibble(
#'   a = c(1,1,1), x = c(NA, NA, NA), b = c(1, 1, NA), 
#'   z = c(1, 2, 2), e = c(1, 2, NA))
#' 
#' drop_uninformative_columns(data)
#' drop_uninformative_columns(data, na_distinct = FALSE)
drop_uninformative_columns <- function(data, na_distinct = TRUE) {
  chk_data(data)
  chk_flag(na_distinct)
  if(nrow(data)) {
    informative <- informative_na_distinct
    if(!na_distinct) {
      informative <- informative_na_not_distinct
    }
    data <- dplyr::select(data, !where(informative))
  }
  if(!ncol(data)) {
    data <- dplyr::slice(data, integer(0))
  }
  data
}
