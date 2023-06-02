#' Summarise Each Group Down to One Row
#'
#' Wrapper on `dplyr::summarise` that sets the default for the .group variable
#' to "keep". This means that all the groups set in `dplyr::group_by` are
#' retained, not just the first group.
#' 
#' @inherit dplyr::summarise
#' @seealso [`dplyr::summarise()`] and [`dplyr::summarize()`]
#' @export
#'
#' @examples
#'  df <- data.frame(
#'   group = c("A", "A", "B", "B"), 
#'   id = c(1, 1, 2, 2), 
#'   value = c(10, 4, 20, 6)
#'  )
#' # summarise2 doesn't produce message about groups
#' df |> dplyr::group_by(group, id) |> summarise2(mean = mean(value))
#' # summarise doesn't retain all the groups set in `group_by`
#' df |> dplyr::group_by(group, id) |> dplyr::summarise(mean = mean(value))
summarise2 <- function(.data, ..., .by = NULL, .groups = "keep") {
  dplyr::summarize(.data, ..., .by = !!.by, .groups = .groups)
}

#' @rdname summarise2
#' @export
summarize2 <- summarise2
