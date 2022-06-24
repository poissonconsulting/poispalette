#' discrete colour scale constructor for poisson colours
#'
#' @param palette Character name of palette in pois_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale()
#' @export
scale_colour_disc_poisson <- function(palette = getOption("poispalette.colours", "colours"),
                                      reverse = FALSE, ...) {
  
  if(length(palette) == 1L){
    pal <- pois_pal_disc(palette = palette, reverse = reverse)    
  } else {
    pal <- pois_pal_custom(palette = palette, reverse = reverse)
  }
  
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
