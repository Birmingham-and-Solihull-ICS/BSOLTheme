#' Creates the BSOL Theme for ggplot
#'
#' Creates a base theme for ggplot objects.
#'
#' @param base_family The font to use in this theme
#'
#' @export
#'
#' @import ggplot2
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' library(BSOLTheme)
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, colour = Species)) +
#'   geom_point() +
#'   theme_bsol()
#' }
theme_bsol <- function(base_family = "Arial") {
  theme_classic(base_family = base_family) +
    theme(
      panel.background = element_blank(),
      panel.grid = element_blank(),
      plot.title = element_text(face="bold", size = 16),
      plot.subtitle = element_text(face="italic",size = 10),
      axis.line = element_line(colour = bsol_theme_cols("charcoal"), linewidth = 0.75),
      strip.background = element_rect(fill = bsol_theme_cols("light_slate")),
      panel.grid.major = element_line(colour = "#b3b3b3", linewidth = 0.4),
      panel.grid.minor = element_line(colour = "#cfcfcf", linewidth = 0.4),


      )
}
