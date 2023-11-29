#' BSOL Theme Colours
#'
#' This function returns the colours that are used in the BSOL ICS theme as
#' a named vector of RGB values in hexadecimal form.
#'
#' If no arguments are passed to the function, then all of the colours are
#' returned. If only specific colours are required, then the names of the
#' colours that are required can be passed as strings to the function, and only
#' those colours will be returned.
#'
#' If a "palette" is selected then no arguments should be passed to ...
#'
#' Only one palette can be selected at a time.
#'
#' @param ... individual colours that you wish to get the values of
#' @param palette a name of a palette to select the colours of
#'
#' @return a named vector of RGB colours in hexadecimal form
#' @export
#'
#' @examples
#' # show all of the colours
#' bsol_theme_cols()
#' # or, just show some colours
#' bsol_theme_cols("green", "orange", "deep_navy", "nhs_blue")
#' # or, select a single palette
#' bsol_theme_cols(palette = "ics_orange")
bsol_theme_cols <- function(...,
                          palette = c(
                            NA,
                            "main",
                            "alternative",
                            "ics_blue",
                            "ics_orange",
                            "ics_green",
                            "ics_purple",
                            "ics_navy"
                          )) {
  # take the ... argument's and convert to a unique vector
  dots <- unique(c(...))
  # verify that the palette argument is valid, i.e. it is in the list of allowed
  # values (from the argument definition)
  pallete <- match.arg(palette)

  # if a palette has not been selected, then return the selected colours
  if (is.na(pallete)) {
    # if no colour's have been specified, then select all
    if (length(dots) < 1) {
      dots <- names(bsol_theme_colours)
    }
    # immediately return the selected colours
    return(bsol_theme_colours[dots])
  }

  # if we are selecting a palette then we shouldn't be specifying colours to
  # select
  if (length(dots) > 0) {
    stop("cannot specify colours and a palette to use")
  }

  # return the colours that are part of this palette
  # Taken from ICS branding guidelines in 'Colour Palette'
  colours <- switch(palette,
    "main" = c("green", "light_blue", "orange", "deep_navy", "purple"),
    "alternative" = c("light_blue", "black_navy", "white"),

    "ics_blue" = c("light_blue", "white", "green"),
    "ics_orange" = c("orange", "white", "deep_navy"),
    "ics_green" = c("green", "purple", "deep_navy"),
    "ics_purple" = c("purple", "blue", "deep_navy"),
    "ics_navy" = c("deep_navy", "white", "orange")
  )

  # return the colours from the selected palette
  return(bsol_theme_colours[colours])
}
