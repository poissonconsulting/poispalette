#' poisson colours
#' 
#' @param ... Character names of Poisson colours
#' @return a named vector of hex colours
#' @export
#'
#' @examples
#' pois_cols()
pois_cols <- function(...) {
  cols <- c(...)
  
  if (is.null(cols))
    return (pois_colours)
  
  poispalette::pois_colours[cols]
}

#' Return function to interpolate a poisson color palette
#'
#' @param palette Character name of palette in pois_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
pois_pal <- function(palette = "p1", reverse = FALSE, ...) {
  
  pois_palettes <- list(
  cool = c("blue", "green"),
  hot = c("orange3", "red"),
  p1 = c("black", "red", "blue", "green4", "orange3", "slategray"),
  p2 = c("black", "red", "blue", "green4", "orange3","slategray", "purple"),
  p3 = c("black", "red", "blue", "green4", "brown", "slategray", "orchid",
          "lightskyblue","aquamarine4", "orange3"))
  
  pal <- pois_palettes[[palette]]
  
  if (reverse) pal <- rev(pal)
  
  grDevices::colorRampPalette(pal, ...)
}

#' Color scale constructor for poisson colors
#'
#' @param palette Character name of palette in pois_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_colour_pois <- function(palette = "p1", discrete = TRUE, reverse = FALSE, ...) {
  pal <- pois_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("pos_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for poisson colors
#'
#' @param palette Character name of palette in pois_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_pois <- function(palette = "p1", discrete = TRUE, reverse = FALSE, ...) {
  pal <- pois_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("pos_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}

#' Poisson Colours
#'
#' @format A named character vector of Poisson Colours as hex codes
#' @examples
#' pois_colours
"pois_colours"