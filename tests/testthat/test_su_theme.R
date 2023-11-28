library(testthat)
library(mockery)

context("bsol_theme")

test_that("it returns a ggplot2 theme", {
  theme <- bsol_theme()

  expect_s3_class(theme, c("theme", "gg"), TRUE)
})

test_that("it calls theme_classic", {
  m <- mock(cycle = TRUE)

  stub(bsol_theme, "theme_classic", m)

  bsol_theme()
  bsol_theme("")

  expect_called(m, 2)
  expect_args(m, 1, base_family = "Arial Bold")
  expect_args(m, 2, base_family = "")
})
