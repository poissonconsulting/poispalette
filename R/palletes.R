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

#' Return function to subset poisson colour palette
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
  
  palette <- pois_cols(.pois_palettes[[palette]])
  if (reverse) palette <- rev(palette)
  
  make_palette_subsetter(palette)
}

#' Return function to subset a user provided colour palette
#'
#' @param palette Character name of palette in pois_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colourRampPalette()
#'
#' @export
pois_pal_custom <- function(palette, reverse = FALSE, ...) {
  chk_s3_class(palette, "character")
  chk_flag(reverse)
  chk_hex(palette)
  
  if (reverse) palette <- rev(palette)
  
  make_palette_subsetter(palette)
}

#' Return interpolated color gradient for a continuous poisson colour palette
#'
#' @param palette Character name of palette in pois_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param n_steps Number of steps in gradient
#' @param n_col Number of colours to subset from the palette (optional)
#'
#' @export
pois_pal_grad <- function(palette, 
                          reverse = FALSE,
                          n_steps = 256,
                          n_col = getOption("poispalette.n_col", NULL)){
  chk_numeric(n_steps)
  chk_s3_class(palette, "character")
  chk_flag(reverse)
  
  if(all(length(palette) == 1 & !vld_hex(palette))) {
    if (!palette %in% names(.pois_palettes)) err("Name of palette not found in `.pois_palettes`")
    palette <- pois_cols(.pois_palettes[[palette]])
  } else {
    chk_hex(palette)
  }
  
  if(!is.null(n_col)) {
    chk_numeric(n_col)
    if(n_col < 2) err("Argument `n_col` must be 2 or greater.")
    if(n_col < length(palette)) err("Argument `n_col` is less than number of colours in palette.")
  
    palette <- palette[1:n_col]
    }
  
  if (reverse) palette <- rev(palette)
  
  grad <- colorscale::chroma_scale$new()
  grad$bezier(palette)
  grad$scale()
  grad$correctLightness()
  grad$colors(n_steps)
  grad$eval()
}