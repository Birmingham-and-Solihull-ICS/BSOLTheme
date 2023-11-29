library(testthat)
library(mockery)

context("bsol_presentation")

test_that("calls xaringan::moon_reader", {
  m <- mock("moon_reader")
  s <- mock("bsol_xaringan.css")

  stub(bsol_presentation, "xaringan::moon_reader", m)
  stub(bsol_presentation, "system.file", s)

  bsol_presentation()

  expect_called(s, 1)
  expect_args(s, 1,
    "rmarkdown/templates/bsol-presentation",
    "bsol_xaringan.css",
    package = "BSOLTheme"
  )

  expect_called(m, 1)
})
