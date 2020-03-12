#' poisson colours
#' 
#' @param cols Character names of Poisson colours
#' @return a named vector of hex colours
#' @export
#'
#' @examples
#' pois_cols()
  pois_cols <- function(cols = NULL){  
  if (is.null(cols))
    return (.pois_colours)
  
  chk::chk_s3_class(cols, "character")
  if(!all(cols %in% names(.pois_colours))) err("One or more values of cols not in pois_colours")
  
  .pois_colours[cols]
}

#' Return function to interpolate a poisson colour palette
#'
#' @param palette Character name of palette in pois_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colourRampPalette()
#'
pois_pal <- function(palette = "legacy1", reverse = FALSE, ...) {

  chk::chk_s3_class(palette, "character")
  if(!length(palette) == 1L) err("Value of palette must be length 1")
  if(!palette %in% names(.pois_palettes)) err("Name of palette not found in pois_palettes")
  
  pal <- pois_cols(.pois_palettes[[palette]])
  if (reverse) pal <- rev(pal)
  
  grDevices::colorRampPalette(pal, ...)
}

#' colour scale constructor for poisson colours
#'
#' @param palette Character name of palette in pois_palettes
#' @param discrete Boolean indicating whether colour aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_colour_pois <- function(palette = "colours", discrete = TRUE, reverse = FALSE, ...) {
  chk::chk_flag(discrete)
  chk::chk_flag(reverse)
  
  pal <- pois_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("pos_", palette), palette = pal, ...)
  } else { 
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
  
}

#' Fill scale constructor for poisson colours
#'
#' @param palette Character name of palette in pois_palettes
#' @param discrete Boolean indicating whether colour aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_pois <- function(palette = "colour", discrete = TRUE, reverse = FALSE, ...) {
  chk::chk_flag(discrete)
  chk::chk_flag(reverse)
  
  pal <- pois_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("pos_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}

#' Poisson Colours
#' 
#'  @format A named character vector of Poisson Colours as hex codes
#'  @examples 
#'  .pois_colours
"pois_colours"

#' Poisson Palettes
#' 
#'  @format A list of character vectors of Poisson colour palettes
#'  @examples 
#'  .pois_palettes
"pois_palettes"
