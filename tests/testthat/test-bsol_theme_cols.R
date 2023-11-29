library(testthat)

context("bsol_theme_cols")

bsol_theme_colours <- c(
  green = "#8cedab",
  light_blue = "#4fbff0",
  orange = "#fc8700",
  deep_navy = "#031d44",
  purple = "#b88ce3",

  nhs_blue = "#005EB8",
  light_slate = "#b2b7b9",
  charcoal = "#2c2825"
)

test_that("when no arguments all of the colours are returned", {
  expected <- bsol_theme_colours
  actual <- bsol_theme_cols()
  expect_equal(actual, expected)
})

test_that("when arguments are passed to ... only those colours are returned", {
  fn <- function(...) {
    colours <- c(...)
    expected <- bsol_theme_colours[colours]
    actual <- bsol_theme_cols(colours)
    expect_equal(actual, expected)
  }

  fn("ics_orange")
  fn("ics_orange", "orange")
  fn("ics_purple", "purple", "blue")
  fn("red", "orange", "dark_slate")
})

test_that("when a palette is passed, only the palettes colours are returned", {
  fn <- function(palette, colours) {
    expected <- bsol_theme_colours[colours]
    actual <- bsol_theme_cols(palette = palette)
    expect_equal(actual, expected)
  }

  fn("main", c("green", "light_blue", "orange", "deep_navy", "purple"))
  fn("ics_blue", c("light_blue", "white", "green"))
  fn("ics_orange", c("orange", "white", "deep_navy"))
  fn("ics_green", c("green", "purple", "deep_navy"))
  fn("ics_purple", c("purple", "blue", "deep_navy"))
  fn("ics_navy",c("deep_navy", "white", "orange"))
})

test_that("an error occurs when an invalid palette is passed", {
  expect_error(bsol_theme_cols(palette = "invalid_palette"))
})

test_that("an error occurs if a palette is specified as well as colours", {
  expect_error(bsol_theme_cols("orange", palette = "main"))
})
