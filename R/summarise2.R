#' Summarise Each Group Down to One Row
#' 
#' Wrapper on dplyr::summarise that sets the .group variable to "keep".
#'
#' @inherit dplyr::summarise
#' @return A dataframe
#' @export
#'
#' @examples
#'  df <- data.frame(
#'   group = c("A", "A", "B", "B"), 
#'   id = c(1, 1, 2, 2), 
#'   value = c(10, 4, 20, 6)
#'  )
#' df |> dplyr::group_by(group, id) |> summarise2(mean = mean(value))
summarise2 <- function(.data, ..., .by = NULL) {
  dplyr::summarize(.data, ..., .by = NULL, .groups = "keep")
}

#' @rdname summarise2
#' @export
summarize2 <- summarise2
