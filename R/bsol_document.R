#' Convert to an BSOL Word document
#'
#' Format for converting from R Markdown to a BSOL branded MS Word
#' document.
#'
#' See the \href{https://rmarkdown.rstudio.com/word_document_format.html}{online
#' documentation} for additional details on using the \code{word_document}
#' format.
#'
#' @inheritParams rmarkdown::pdf_document
#' @inheritParams rmarkdown::html_document

#' @return R Markdown output format to pass to \code{\link{render}}
#'
#' @importFrom rmarkdown word_document
#' @importFrom ggplot2 theme_set
#'
#' @examples
#' \dontrun{
#' library(rmarkdown)
#'
#' # simple invocation
#' render("input.Rmd", bsol_document())
#' }
#' @export
bsol_document <- function(
                        toc = FALSE,
                        toc_depth = 1,
                        fig_caption = TRUE,
                        df_print = "kable",
                        highlight = "default",
                        keep_md = FALSE,
                        md_extensions = NULL,
                        pandoc_args = NULL) {

  # get the locations of resource files located within the package
  bsol_template <- system.file("rmarkdown/templates/bsol-document", "ICS_Word_Template.docx",
    package = "BSOLTheme"
  )

  # page width: A4 = 21cm, left+right margin = 2cm each, so width is 17cm
  fig_width <- 6.7 # ~17 cm
  fig_height <- 3.8 # ~16:9 aspect ratio

  # Set's the base ggplot theme to the BSOL Theme
  ggplot2::theme_set(theme_bsol())

  # call the base word_document function
  rmarkdown::word_document(
    toc = toc,
    toc_depth = toc_depth,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_caption = fig_caption,
    df_print = df_print,
    highlight = highlight,
    reference_docx = bsol_template,
    keep_md = keep_md,
    md_extensions = md_extensions,
    pandoc_args = pandoc_args
  )
}
