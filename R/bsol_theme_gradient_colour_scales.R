#' @rdname bsol_theme_gradient_colour_scales
#' @name bsol_theme_gradient_colour_scales
#' @title BSOL ICS Gradient colour Scale
#'
#' @description
#' Generates a two colour gradient (low-high)
#'
#' @param palette The name of palette to use
#' @param discrete Optional: boolean to indicate that this scale is a discrete
#'    scale. Defaults to TRUE
#' @param reverse Optional: boolean to reverse the direction of the scale.
#'    Defaults to FALSE
#' @param ... additional arguments passed to the ggplot functions
#'
#' @return a scale object to be used with a ggplot object
#'
NULL

#' @export
#' @importFrom ggplot2 discrete_scale scale_color_gradientn
#' @rdname bsol_theme_gradient_colour_scales
scale_colour_bsol <- function(palette = c(
                                        "main",
                                        "alternative",
                                        "ics_blue",
                                        "ics_orange",
                                        "ics_green",
                                        "ics_purple",
                                        "ics_navy"
                            ),
                            discrete = TRUE,
                            reverse = FALSE, ...) {
  palette <- match.arg(palette)

  pal <- bsol_theme_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("bsol_theme_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}
#' @export
#' @rdname bsol_theme_gradient_colour_scales
scale_color_bsol <- scale_colour_bsol

#' @export
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn
#' @rdname bsol_theme_gradient_colour_scales
scale_fill_bsol <- function(palette = c(
                          "main",
                          "alternative",
                          "ics_blue",
                          "ics_orange",
                          "ics_green",
                          "ics_purple",
                          "ics_navy"
                          ),
                          discrete = TRUE,
                          reverse = FALSE, ...) {
  palette <- match.arg(palette)

  pal <- bsol_theme_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("bsol_theme_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
