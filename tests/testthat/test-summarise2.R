test_that("multiple groups do not produce message", {
  df <- data.frame(
    group = c("A", "A", "B", "B"),
    id = c(1, 1, 2, 2),
    value = c(10, 4, 20, 6)
  )
  expect_equal(
    df |> dplyr::group_by(group, id) |> summarise2(mean = mean(value)),
    data.frame(
      group = c("A", "B"),
      id = c(1, 2),
      mean = c(7, 13)
    ) |> dplyr::group_by(group, id)
  )
})

test_that("multiple groups do not produce message with summarize", {
  df <- data.frame(
    group = c("A", "A", "B", "B"),
    id = c(1, 1, 2, 2),
    value = c(10, 4, 20, 6)
  )
  expect_equal(
    df |> dplyr::group_by(group, id) |> summarize2(mean = mean(value)),
    data.frame(
      group = c("A", "B"),
      id = c(1, 2),
      mean = c(7, 13)
    ) |> dplyr::group_by(group, id)
  )
})

