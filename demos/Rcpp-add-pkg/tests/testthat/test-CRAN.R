library(testthat)
test_that("add_interface works for vector size 2", {
  x <- 1:2
  y <- 3:4
  out <- Rcpp.add::add_interface(x, y)
  expect_equal(out, c(4, 6))
})
test_that("add_interface errors for vector size 0", {
  expect_error({
    Rcpp.add::add_interface(numeric(), numeric())
  }, "No data")
})
