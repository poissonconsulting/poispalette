#' poisson colours
#'
#' @param cols Character names of Poisson colours
#' @return a named vector of hex colours
#' @export
#'
#' @examples
#' pois_cols()
pois_cols <- function(cols = NULL) {
  if (is.null(cols)) {
    return(.pois_colours)
  }

  chk_s3_class(cols, "character")
  if (!all(cols %in% names(.pois_colours))) err("One or more values of cols not in pois_colours")

  .pois_colours[cols]
}

#' Return function to interpolate a poisson colour palette
#'
#' @param palette Character name of palette in pois_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colourRampPalette()
#'
#' @export
pois_pal_disc <- function(palette = "colours", reverse = FALSE, ...) {
  chk_s3_class(palette, "character")
  chk_flag(reverse)
  
  if (!length(palette) == 1L) err("Value of palette must be length 1")
  if (!palette %in% names(.pois_palettes)) err("Name of palette not found in `.pois_palettes`")
  
  pal <- pois_cols(.pois_palettes[[palette]])
  if (reverse) pal <- rev(pal)
  
  subset_palette(pal)
}

#' Return interpolated color gradient for a continuous poisson colour palette
#'
#' @param n Number of steps in gradient
#' @param palette Character name of palette in pois_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#'
#' @export
pois_pal_grad <- function(n = 256, palette, reverse = FALSE){
  chk_numeric(n)
  chk_s3_class(palette, "character")
  chk_flag(reverse)
  
  if(length(palette) == 1) {
    if (!palette %in% names(.pois_palettes)) err("Name of palette not found in `.pois_palettes`")
    pal <- pois_cols(.pois_palettes[[palette]])
  } else {
    if (!all(palette %in% names(.pois_colours))) err("Colours in palette not found in `.pois_colours`")
    pal <- pois_cols(palette)  
  }
  
  if (reverse) pal <- rev(pal)
  
  grad <- colorscale::chroma_scale$new()
  grad$bezier(pal)
  grad$scale()
  grad$correctLightness()
  grad$colors(n)
  grad$eval()
}

#' discrete colour scale constructor for poisson colours
#'
#' @param palette Character name of palette in pois_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale()
#' @export
scale_colour_disc_poisson <- function(palette = "colours", reverse = FALSE, ...) {

  pal <- pois_pal_disc(palette = palette, reverse = reverse)
  ggplot2::discrete_scale("colour", paste0("pois_", palette), palette = pal, ...)
}

#' gradient colour scale constructor for poisson colours
#'
#' @param palette Character name of palette in pois_palettes, or selection 
#' of colour names from pois_cols
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to scale_color_gradientn()
#' @export
scale_colour_grad_poisson <- function(palette = "cool", reverse = FALSE, ...) {
  
  pal <- pois_pal_grad(palette = palette, reverse = reverse)
  ggplot2::scale_color_gradientn(colours = pal, ...)
}

#' discrete fill scale constructor for poisson colours
#'
#' @param palette Character name of palette in pois_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale()
#'            
#' @export
scale_fill_disc_poisson <- function(palette = "colours", reverse = FALSE, ...) {

  pal <- pois_pal_disc(palette = palette, reverse = reverse)
  ggplot2::discrete_scale("fill", paste0("pois_", palette), palette = pal, ...)
}

#' Gradient fill scale constructor for poisson colours
#'
#' @param palette Character name of palette in pois_palettes, or selection 
#' of colour names from pois_cols
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to scale_color_gradientn()
#' @export
scale_fill_grad_poisson <- function(palette = "cool", reverse = FALSE, ...) {
  
  pal <- pois_pal_grad(256, palette = palette, reverse = reverse)
  ggplot2::scale_fill_gradientn(colours = pal, ...)
}
