test_that("removes spaces from strings", {
  input <- "string of words"
  output <- str_to_snake_case(input)
  expect_equal(output, "string_of_words")
  })

test_that("make everything lowercase", {
  input <- "StRiNg oF wOrDs"
  output <- str_to_snake_case(input)
  expect_equal(output, "string_of_words")
})

test_that("underscores already present not replaced",{
  input <- "StRiNg_oF wOrDs"
  output <- str_to_snake_case(input)
  expect_equal(output, "string_of_words")
})

test_that(" ",{
  input <- 
  output <- str_to_snake_case(input)
  expect_equal(output, "string_of_words")
})