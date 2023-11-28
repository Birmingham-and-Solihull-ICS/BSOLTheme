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
#'   bsol_theme()
#' }
su_theme <- function(base_family = "Arial Bold") {
  theme_classic(base_family = base_family) +
    theme(
      panel.background = element_blank(),
      panel.grid = element_blank(),
      axis.line = element_line(colour = su_theme_cols("charcoal")),
      strip.background = element_rect(fill = su_theme_cols("light_slate"))
    )
}