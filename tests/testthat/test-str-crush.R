test_that("str_crush removes all spaces from all parts of string", {
  expect_equal(str_crush(" "), "")
  expect_equal(str_crush("\n \t"), "")
  expect_equal(str_crush("ab\t\tc\t"), "abc")
  expect_equal(str_crush("\ta  bc"), "abc")
  expect_equal(str_crush("\ta\t bc\t"), "abc")
})
