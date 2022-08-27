#' Coalesce Data
#'
#' Coalesce values in multiple columns by finding the first non-missing
#' value at each position.
#' Coalesced columns are removed.
#'
#' Coalescence is performed in the order
#' specified in the coalesce argument such that a column produced by
#' coalescence can be further coalesced.
#'
#' @param x A data frame.
#' @param coalesce A uniquely named list of character vectors where the names are the
#' new column names and the values are the names of the columns to coalesce.
#' If a single value is provided for a column it is treated as a regular expression.
#' @param quiet A flag specifying whether to provide messages.
#' @return The original data frame with one or more columns coalesced into a 
#' new column.
#'
#' @seealso [`dplyr::coalesce()`]
#'
#' @export
#' @examples 
#' data <- data.frame(x = c(1, NA, NA), y = c(NA, 3, NA), z = c(7, 8, 9), a = c(4, 5, 6))
#' coalesce_data(data, list(b = c("x", "y")), quiet = TRUE)
#' coalesce_data(data, list(z = c("y", "x"), d = c("z", "a")))
coalesce_data <- function(x, coalesce = list(), quiet = FALSE) {
  chk_data(x)
  chk_list(coalesce)
  chk_flag(quiet)
  
  if(!length(coalesce)) return(x)
  if(!ncol(x)) return(x)
  
  chk_named(coalesce)
  chk_unique(names(coalesce))
  chk_all(coalesce, chk_character)
  chk_all(coalesce, check_dim, values = TRUE)
  chk_all(coalesce, chk_not_any_na)
  
  sf <- vld_s3_class(x, "sf")
  
  if(sf) {
    x <- tibble::as_tibble(x)
  }
  for(i in seq_along(coalesce)) {
    x <- coalesce_cols(x, coalesce[i], quiet = quiet)
  }
  if(sf) {
    if(!requireNamespace("sf", quietly = TRUE)) {
      rlang::abort("sf package is required to preserve sf objects")
    }
    x <- sf::st_as_sf(x)
  }
  x
}

coalesce_cols <- function(x, coalesce, quiet) {
  new_name <- names(coalesce)
  coalesce <- unlist(coalesce)
  
  if(length(coalesce) == 1) {
    coalesce <- names(x)[grepl(coalesce, names(x))]
  }
  coalesce <- unique(coalesce)
  coalesce <- coalesce[coalesce %in% names(x)]
  coalesce <- coalesce[!vapply(x[coalesce], vld_s3_class, TRUE, class = "sfc")]
  co <- names(x) %in% coalesce
  if(!quiet) {
    message("Coalesced '", new_name, "' from: ", cc(coalesce, conj = " and "))
  }
  if(!any(co)) {
    x[new_name] <- NA
    return(x)
  }
  sub <- x[coalesce]
  x <- x[!co]
  x[new_name] <- do.call("coalesce", as.list(sub))
  x
}
