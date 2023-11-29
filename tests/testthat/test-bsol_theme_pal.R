library(testthat)

context("bsol_theme_pal")

test_that("it returns a function", {
  expect_is(bsol_theme_pal(), "function")
})

test_that("it returns expected colours", {
  expected <- c("#8CEDAB", "#88ACA0", "#56402D", "#B88CE3")
  actual <- bsol_theme_pal()(4)
  expect_equal(actual, expected)

  expected <- c("#8CEDAB", "#4FBFF0", "#FC8700", "#031D44", "#B88CE3")
  actual <- bsol_theme_pal()(5)
  expect_equal(actual, expected)
})

test_that("it returns expected colours when reversed", {
  expected <- c(
    "#031D44", "#67778E", "#CCD1D9", "#FEE6CB", "#FDB665"
    , "#FC8700"
  )
  actual <- bsol_theme_pal(palette = "ics_orange", rev = TRUE)(6)
  expect_equal(actual, expected)
})

test_that("an error occurs when an invalid palette is passed", {
  expect_error(bsol_theme_pal(palette = "invalid_palette"))
})
