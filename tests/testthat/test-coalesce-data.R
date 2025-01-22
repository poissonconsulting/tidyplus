test_that("coalesce_data unaltered with no coalesce", {
  data <- data.frame(x = 1)
  expect_identical(coalesce_data(data), data)
})

test_that("coalesce_data unaltered with coalesce 1 column", {
  data <- data.frame(x = 1)
  expect_message(
    expect_identical(
      coalesce_data(data, list(x = "x")), 
      data
    ),
    "Coalesced 'x' from: 'x'"
  )
})

test_that("coalesce_data gets first non-missing", {
  data <- data.frame(x = 1, y = 2)
  coalesce <- list(z = c("x", "y"))
  new <- data.frame(z = 1)
  expect_message(
    expect_identical(
      coalesce_data(data, coalesce = coalesce), 
      new
    ), 
    "Coalesced 'z' from: 'x' and 'y'"
  )
})

test_that("coalesce_data sensitive to order of columns ", {
  data <- data.frame(x = 1, y = 2)
  coalesce <- list(z = c("y", "x"))
  new <- data.frame(z = 2)
  expect_message(
    expect_identical(
      coalesce_data(data, coalesce = coalesce), 
      new
    ), 
    "Coalesced 'z' from: 'y' and 'x'"
  )
})

test_that("coalesce_data handles all missing values of different class", {
  data <- data.frame(x = NA, y = NA_character_)
  coalesce <- list(z = ".*")
  new <- data.frame(z = NA_character_)
  expect_message(
    expect_identical(
      coalesce_data(data, coalesce = coalesce), 
      new
    ), 
    "Coalesced 'z' from: 'x' and 'y'"
  )
})

test_that("coalesce_data can replace values with new one", {
  data <- data.frame(x = 1, y = 2)
  coalesce <- list(y = c("x", "y"))
  new <- data.frame(y = 1)
  expect_message(
    expect_identical(
      coalesce_data(data, coalesce = coalesce), 
      new
    ), 
    "Coalesced 'y' from: 'x' and 'y'"
  )
})

test_that("coalesce_data tags on end", {
  data <- data.frame(x = 1, y = 2, z = 3)
  coalesce <- list(y = c("x", "y"))
  new <- data.frame(z = 3, y = 1)
  expect_message(
    expect_identical(
      coalesce_data(data, coalesce = coalesce), 
      new
    ), 
    "Coalesced 'y' from: 'x' and 'y'"
  )
})

test_that("coalesce_data overwrites existing column", {
  data <- data.frame(x = 1, y = 2, z = 3)
  coalesce <- list(z = c("x", "y"))
  new <- data.frame(z = 1)
  expect_message(
    expect_identical(
      coalesce_data(data, coalesce = coalesce), 
      new
    ), 
    "Coalesced 'z' from: 'x' and 'y'"
  )
})

test_that("coalesce_data handles two coalesce values", {
  data <- data.frame(x = 1, y = 2, z = 3, a = 4)
  coalesce <- list(z = c("y", "x"), d = c("z", "a"))
  new <- data.frame(d = 2)
  expect_message(
    expect_message(
      expect_identical(
        coalesce_data(
          data, 
          coalesce = coalesce, quiet = FALSE
        ), 
        new
      ), 
    "Coalesced 'z' from: 'y' and 'x'"), "Coalesced 'd' from: 'z' and 'a'"
  )
})

test_that("coalesce_data quiet = FALSE", {
  data <- data.frame(x = 1, y = 2, z = 3, a = 4)
  coalesce <- list(z = c("y", "x"), d = c("z", "a"))
  new <- data.frame(d = 2)
  expect_message(
    expect_message(
      coalesce_data(
        data, 
        coalesce = coalesce, quiet = FALSE
      ),
      "Coalesced 'z' from: 'y' and 'x'"
    ),
    "Coalesced 'd' from: 'z' and 'a'"
  )
})

test_that("works with sf columns", {
  skip_if_not_installed("sf")
  
  data <- data.frame(X = 1, Y = 2, z = 3, a = 4)
  data <- sf::st_as_sf(data, coords = c("X", "Y"), sf_column_name = "map")
  expect_message(
    data <- coalesce_data(
      data, coalesce = list(d = c("z", "a")), 
      quiet = FALSE
    ),
    "Coalesced 'd' from: 'z' and 'a'"
  )
  
  output <- sf::st_as_sf(
    tibble::tibble(X = 1, Y = 2, d = 3), 
    coords = c("X", "Y"), 
    sf_column_name = "map"
  )
  output <- output[c(2, 1)]

  expect_identical(
    data,
    output
  )
})
