informative_na_distinct <- function(x) length(unique(x)) == 1L
informative_na_not_distinct <- function(x) length(unique(x[!is.na(x)])) %in% 0:1
na_if_blank <- function(x) dplyr::na_if(x, "")
