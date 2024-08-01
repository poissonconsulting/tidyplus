test_that("multiple groups do not produce message", {
  df <- data.frame(
    group = c("A", "A", "B", "B"),
    id = c(1, 1, 2, 2),
    value = c(10, 4, 20, 6)
  )
  output <- df |>
    dplyr::group_by(group, id) |>
    summarise2(mean = mean(value))
  expect_equal(
    output,
    data.frame(
      group = c("A", "B"),
      id = c(1, 2),
      mean = c(7, 13)
    ) |> dplyr::group_by(group, id)
  )
  expect_s3_class(
    output,
    c("grouped_df", "tbl_df", "tbl", "data.frame")
  )
})

test_that("multiple groups do not produce message with summarize2", {
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

test_that("works on non grouped data", {
  df <- data.frame(
    group = c("A", "A", "B", "B"),
    id = c(1, 1, 2, 2),
    value = c(10, 4, 20, 6)
  )
  output <- df |> summarise2(mean = mean(value))
  expect_equal(
    output,
    data.frame(
      mean = c(10)
    )
  )
  expect_s3_class(
    output,
    c("data.frame")
  )
})

test_that("same data output as summarise with two groups", {
  df <- data.frame(
    group = c("A", "A", "B", "B"),
    id = c(1, 1, 2, 2),
    value = c(10, 4, 20, 6)
  )
  output <- df |>
    dplyr::group_by(group, id) |>
    summarise2(mean = mean(value))
  orginal <- suppressMessages(
    df |> dplyr::group_by(group, id) |> dplyr::summarise(mean = mean(value))
  )
  expect_equal(
    output$group,
    orginal$group
  )
  expect_equal(
    output$id,
    orginal$id
  )
  expect_equal(
    output$mean,
    orginal$mean
  )
})

test_that("same data output as summarise with one group", {
  df <- data.frame(
    group = c("A", "A", "B", "B"),
    id = c(1, 1, 2, 2),
    value = c(10, 4, 20, 6)
  )
  output <- df |>
    dplyr::group_by(group) |>
    summarise2(mean = mean(value))
  orginal <- suppressMessages(
    df |> dplyr::group_by(group) |> dplyr::summarise(mean = mean(value))
  )
  expect_equal(
    output$group,
    orginal$group
  )
  expect_equal(
    output$mean,
    orginal$mean
  )
})

test_that("summarise2 returns empty dataframe same as dplyr::summarise", {
  expect_identical(summarise2(data.frame()), dplyr::summarise(data.frame()))
  expect_identical(summarise2(dplyr::tibble()), dplyr::summarise(dplyr::tibble()))

  expect_identical(summarize2(data.frame()), dplyr::summarise(data.frame()))
  expect_identical(summarize2(dplyr::tibble()), dplyr::summarise(dplyr::tibble()))
})

test_that("can pass column names stored as text with .data", {
  df <- data.frame(
    group = c("A", "A", "B", "B"),
    id = c(1, 1, 2, 2),
    value = c(10, 4, 20, 6)
  )
  var <- "value"
  expect_snapshot(df |> dplyr::group_by(group) |> summarise2(mean = mean(.data[[var]])))
})

test_that("can access column name with .data$col_name", {
  df <- data.frame(
    group = c("A", "A", "B", "B"),
    id = c(1, 1, 2, 2),
    value = c(10, 4, 20, 6)
  )
  expect_snapshot(df |> dplyr::group_by(group) |> summarise2(mean = mean(.data$value)))
})
