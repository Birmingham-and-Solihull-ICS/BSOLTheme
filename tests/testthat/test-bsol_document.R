library(testthat)
library(mockery)

context("bsol_document")

test_that("calls rmarkdown::word_document", {
  m <- mock("word_document")
  stub(bsol_document, "rmarkdown::word_document", m)

  stub(bsol_document, "system.file", "bsol_template.docx")
  stub(bsol_document, "ggplot2::theme_set", "")

  bsol_document()

  expect_called(m, 1)
  expect_args(m, 1,
    toc = FALSE,
    toc_depth = 1,
    fig_width = 6.7,
    fig_height = 3.8,
    fig_caption = TRUE,
    df_print = "kable",
    highlight = "default",
    reference_docx = "bsol_template.docx",
    keep_md = FALSE,
    md_extensions = NULL,
    pandoc_args = NULL
  )
})

test_that("it sets the ggplot theme to bsol_theme", {
  m <- mock("theme_bsol")
  stub(bsol_document, "ggplot2::theme_set", m)

  stub(bsol_document, "rmarkdown::word_document", "")
  stub(bsol_document, "system.file", "")

  bsol_document()

  expect_called(m, 1)
  expect_call(m, 1, ggplot2::theme_set(theme_bsol()))
})

test_that("it uses the correct template file if using numbered headings", {
  m <- mock("bsol_template.docx", cycle = TRUE)
  stub(bsol_document, "system.file", m)

  stub(bsol_document, "rmarkdown::word_document", "")
  stub(bsol_document, "ggplot2::theme_set", "")

  bsol_document()

  expect_called(m, 1)

  expect_args(m, 1,
    "rmarkdown/templates/bsol-document",
    "ICS_Word_Template.docx",
    package = "BSOLTheme"
  )

})
