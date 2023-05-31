#' Summarise Each Group Down to One Row
#' 
#' Wrapper on dplyr::summarise that sets the .group variable to "keep".
#'
#' @inherit dplyr::summarise
#' @return A dataframe
#' @export
#'
#' @examples
#' summarise2(mtcars, mean = mean(mpg))
summarise2 <- function(.data, ..., .by = NULL) {
  dplyr::summarize(.data, ..., .by = NULL, .groups = "keep")
}

#' @rdname summarise2
#' @export
summarize2 <- summarise2
