#' discrete colour scale constructor for poisson colours
#'
#' @param palette Character name of palette in pois_palettes
#' @param order A numeric or character vector indicating the order of colours in the palette. Can be a subset.
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale()
#' @export
scale_colour_disc_poisson <- function(
    ...,
    palette = getOption("poispalette.colours", "discrete"),
    order = NULL,
    reverse = FALSE
    ) {
  
  args_add <- list(...)
  if(length(palette) == 1L & !all(vld_hex(palette))){
    pal <- pois_pal_disc(palette = palette, reverse = reverse, order = order)    
  } else {
    pal <- pois_pal_custom(palette = palette, reverse = reverse)
  }
  
  ggplot2::discrete_scale(aesthetics = "colour", palette = pal, na.value = "#7F7F7F", ...)
}

#' discrete fill scale constructor for poisson colours
#'
#' @param palette Character name of palette in pois_palettes
#' @param order A numeric or character vector indicating the order of colours in the palette. Can be a subset.
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale()
#'            
#' @export
scale_fill_disc_poisson <- function(
    ...,
    palette = getOption("poispalette.colours", "discrete"),
    order = NULL,
    reverse = FALSE
    ){

  if(length(palette) == 1L & !all(vld_hex(palette))){
    pal <- pois_pal_disc(palette = palette, reverse = reverse, order = order)    
  } else {
    pal <- pois_pal_custom(palette = palette, reverse = reverse)
  }
  
  ggplot2::discrete_scale(aesthetics = "fill", palette = pal, na.value = "#7F7F7F", ...)
}

#' gradient colour scale constructor for poisson colours
#'
#' @param palette Character name of palette in pois_palettes, or selection 
#' of colour names from pois_cols
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param n_steps Number of steps in gradient
#' @param n_col Number of colours to subset from the palette (optional)
#' @param ... Additional arguments passed to scale_color_gradientn()
#' @export
scale_colour_grad_poisson <- function(
    ..., 
    palette = getOption("poispalette.gradient", "cool"),
    reverse = FALSE,
    n_steps = 256,
    n_col = getOption("poispalette.n_col", NULL)
    ){
  
  pal <- pois_pal_grad(palette = palette, reverse = reverse, n_col = n_col)
  ggplot2::scale_color_gradientn(colours = pal, na.value = .na_colour, ...)
}

#' Gradient fill scale constructor for poisson colours
#'
#' @param palette Character name of palette in pois_palettes, or selection 
#' of colour names from pois_cols
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param n_steps Number of steps in gradient
#' @param n_col Number of colours to subset from the palette (optional)
#' @param ... Additional arguments passed to scale_color_gradientn()
#' @export
scale_fill_grad_poisson <- function(
    ..., 
    palette = getOption("poispalette.gradient", "cool"),
    reverse = FALSE,
    n_steps = 256,
    n_col = getOption("poispalette.n_col", NULL)
    ){
  
  pal <- pois_pal_grad(palette = palette, reverse = reverse, n_col = n_col)
  ggplot2::scale_fill_gradientn(colours = pal, na.value = .na_colour, ...)
}

#' @export
#' @rdname scale_colour_grad_poisson
#' @usage NULL
scale_color_grad_poisson <- scale_colour_grad_poisson

#' @export
#' @rdname scale_colour_disc_poisson
#' @usage NULL
scale_color_disc_poisson <- scale_colour_disc_poisson
