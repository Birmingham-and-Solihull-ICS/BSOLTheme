library(testthat)
library(mockery)

context("scale_colour_bsol")

test_that("scale_color_bsol is the same as scale_colour_bsol", {
  expect_identical(scale_color_bsol, scale_colour_bsol)
})

test_that("scale_colour_bsol calls bsol_theme_pal", {
  m <- mock(function(n) rep("#000000", n), cycle = TRUE)

  stub(scale_colour_bsol, "bsol_theme_pal", m)

  scale_colour_bsol()
  scale_colour_bsol("ics_orange", reverse = TRUE)

  expect_called(m, 2)

  expect_args(m, 1, palette = "main", reverse = FALSE)
  expect_args(m, 2, palette = "ics_orange", reverse = TRUE)
})

test_that("scale_colour_bsol calls discrete_scale", {
  pal <- function(n) rep("#000000", n)
  pal_mock <- mock(pal)

  m1 <- mock("discrete_scale")
  m2 <- mock("scale_color_gradientn")

  stub(scale_colour_bsol, "bsol_theme_pal", pal_mock)
  stub(scale_colour_bsol, "discrete_scale", m1)
  stub(scale_colour_bsol, "scale_color_gradientn", m2)

  actual <- scale_colour_bsol()
  expect_called(m1, 1)
  expect_called(m2, 0)

  expect_args(m1, 1, "colour", "bsol_theme_main", palette = pal)

  expect_equal(actual, "discrete_scale")
})


test_that("scale_colour_bsol calls scale_color_gradientn", {
  pal <- function(n) rep("#000000", n)
  pal_mock <- mock(pal)

  m1 <- mock("discrete_scale")
  m2 <- mock("scale_color_gradientn")

  stub(scale_colour_bsol, "bsol_theme_pal", pal_mock)
  stub(scale_colour_bsol, "discrete_scale", m1)
  stub(scale_colour_bsol, "scale_color_gradientn", m2)

  actual <- scale_colour_bsol(discrete = FALSE)
  expect_called(m1, 0)
  expect_called(m2, 1)

  expect_args(m2, 1, palette = pal(256))

  expect_equal(actual, "scale_color_gradientn")
})


context("scale_fill_bsol")

test_that("scale_fill_bsol calls bsol_theme_pal", {
  m <- mock(function(n) rep("#000000", n), cycle = TRUE)

  stub(scale_fill_bsol, "bsol_theme_pal", m)

  scale_fill_bsol()
  scale_fill_bsol("ics_orange", reverse = TRUE)

  expect_called(m, 2)

  expect_args(m, 1, palette = "main", reverse = FALSE)
  expect_args(m, 2, palette = "ics_orange", reverse = TRUE)
})

test_that("scale_fill_bsol calls discrete_scale", {
  pal <- function(n) rep("#000000", n)
  pal_mock <- mock(pal)

  m1 <- mock("discrete_scale")
  m2 <- mock("scale_fill_gradientn")

  stub(scale_fill_bsol, "bsol_theme_pal", pal_mock)
  stub(scale_fill_bsol, "discrete_scale", m1)
  stub(scale_fill_bsol, "scale_fill_gradientn", m2)

  actual <- scale_fill_bsol()
  expect_called(m1, 1)
  expect_called(m2, 0)

  expect_args(m1, 1, "fill", "bsol_theme_main", palette = pal)

  expect_equal(actual, "discrete_scale")
})


test_that("scale_fill_bsol calls scale_fill_gradientn", {
  pal <- function(n) rep("#000000", n)
  pal_mock <- mock(pal)

  m1 <- mock("discrete_scale")
  m2 <- mock("scale_fill_gradientn")

  stub(scale_fill_bsol, "bsol_theme_pal", pal_mock)
  stub(scale_fill_bsol, "discrete_scale", m1)
  stub(scale_fill_bsol, "scale_fill_gradientn", m2)

  actual <- scale_fill_bsol(discrete = FALSE)
  expect_called(m1, 0)
  expect_called(m2, 1)

  expect_args(m2, 1, palette = pal(256))

  expect_equal(actual, "scale_fill_gradientn")
})
