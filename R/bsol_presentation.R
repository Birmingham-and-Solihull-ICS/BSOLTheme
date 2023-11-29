#' Convert to an BSOL ICS xaringan presentation
#'
#' Format for converting from R Markdown to a Birmingham and Solihull ICS branded xaringan
#' presentation.
#'
#' @param ... additional arguments to pass to [xaringan::moon_reader()]
#'
#' @return R Markdown output format to pass to \code{\link{render}}
#'
#' @importFrom xaringan moon_reader
#'
#' @examples
#' \dontrun{
#' library(rmarkdown)
#'
#' # simple invocation
#' render("input.Rmd", bsol_presentation())
#' }
#' @export
bsol_presentation <- function(...) {

  # get the locations of resource files located within the package
  css <- system.file("rmarkdown/templates/bsol-presentation",
    "bsol_xaringan.css",
    package = "BSOLTheme"
  )

  # call the base word_document function
  xaringan::moon_reader(
    css = c("default", css),
    self_contained = TRUE,
    nature = list(
      ratio = "16:9",
      highlightLines = TRUE,
      countIncrementalSlides = FALSE,
      highlightStyle = "github"
    ),
    ...
  )
}
