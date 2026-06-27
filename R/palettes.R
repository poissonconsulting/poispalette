#' poisson colours
#'
#' @param colours Character names of Poisson colours
#' @return A named character vector of hex colours
#' @export
#'
#' @examples
#' pois_cols()
#' pois_cols(c("red", "yellow"))
pois_cols <- function(colours = NULL) {
  if (is.null(colours)) {
    return(.pois_colours)
  }

  chk_s3_class(colours, "character")
  if (!all(colours %in% names(.pois_colours))) err("One or more values of colours not in .pois_colours")

  .pois_colours[colours]
}

#' poisson palettes
#'
#' @param palette Character names of Poisson palettes. One of 'discrete', 'hot', 'cool'.
#' @return A named character vector of hex colours
#' @export
#'
#' @examples
#' pois_pal()
#' pois_pal("cool")
pois_pal <- function(palette = NULL) {
  if (is.null(palette)) {
    return(.pois_palettes["discrete"][[1]])
  }

  chk_s3_class(palette, "character")
  chk_scalar(palette)
  if (!all(palette %in% names(.pois_palettes))) err("One or more values of palette not in .pois_palettes")

  .pois_palettes[palette][[1]]
}

#' Return function to subset poisson colour palette
#'
#' @param palette Character name of palette. See `pois_pal()` for palette options.
#' @param order A numeric or character vector indicating the order of colours in the palette. Can be a subset.
#' @param reverse Boolean indicating whether the palette should be reversed
#'
#' @return A function that takes the number of colours required and returns a
#'   character vector of that many hex colours from the palette.
#' @export
#'
#' @examples
#' pois_pal_disc("discrete")(3)
pois_pal_disc <- function(palette = "discrete", order = NULL, reverse = FALSE) {
  chk_s3_class(palette, "character")
  chk_flag(reverse)

  if (!length(palette) == 1L) err("Value of palette must be length 1")
  if (!palette %in% names(.pois_palettes)) err("Name of palette not found in `.pois_palettes`")

  pal_name <- palette
  palette <- pois_pal(palette)

  if(!is.null(order)){
    chkor_vld(vld_character(order), vld_numeric(order))

    if(inherits(order, "character")) {
      if(!all(order %in% names(palette))) err("All colours in `order` must match colour names in palette `", pal_name, "`.")
      order <-  match(order, names(palette))
    }

    order <- as.integer(order)
    if(!all(order %in% 1:length(palette))) err("All values of order must be within the range 1 - ", length(palette), ".")

    palette <- c(palette[order], palette)
    palette <- palette[unique(names(palette))]
  }

  if (reverse) palette <- rev(palette)

  make_palette_subsetter(palette)
}

#' Return function to subset a user provided colour palette
#'
#' @param palette Character vector of hex colours.
#' @param order A numeric or character vector indicating the order of colours in the palette. Can be a subset.
#' @param reverse Boolean indicating whether the palette should be reversed
#'
#' @return A function that takes the number of colours required and returns a
#'   character vector of that many hex colours from the palette.
#' @export
#'
#' @examples
#' pois_pal_custom(c("#1E6091", "#D9ED92", "#99D98C"))(3)
pois_pal_custom <- function(palette, order = NULL, reverse = FALSE) {
  chk_s3_class(palette, "character")
  chk_flag(reverse)
  chk_hex(palette)

  if(!is.null(order)){
    chkor_vld(vld_character(order), vld_numeric(order))

    if(inherits(order, "character")) {
      chk_hex(order)
      if(!all(order %in% palette)) err("All colours in `order` must match hexadecimal codes in palette.")
      order <-  match(order, palette)

    }

    order <- as.integer(order)
    if(!all(order %in% 1:length(palette))) err("All values of order must be within the range 1 - ", length(palette), ".")

    palette <- unique(c(palette[order], palette))
  }

  if (reverse) palette <- rev(palette)

  make_palette_subsetter(palette)
}

#' Return interpolated color gradient for a continuous poisson colour palette
#'
#' @param palette Character name of palette in pois_palettes, See `pois_pal()` for palette options.
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param n_steps Number of steps in gradient
#' @param n_col Number of colours to subset from the palette (optional)
#'
#' @return A character vector of `n_steps` interpolated hex colours.
#' @export
#'
#' @examples
#' pois_pal_grad("cool", n_steps = 4)
pois_pal_grad <- function(palette = "cool",
                          reverse = FALSE,
                          n_steps = 256,
                          n_col = getOption("poispalette.n_col", NULL)){
  chk_whole_number(n_steps)
  chk_gt(n_steps, 1)
  chk_s3_class(palette, "character")
  chk_flag(reverse)

  if(length(palette) == 1L && !vld_hex(palette)) {
    if (!palette %in% names(.pois_palettes)) err("Name of palette not found in `.pois_palettes`")
    palette <- pois_pal(palette)
  } else {
    chk_hex(palette)
  }

  if(!is.null(n_col)) {
    chk_whole_number(n_col)
    if(n_col < 2) err("Argument `n_col` must be 2 or greater.")
    if(n_col > length(palette)) err("Argument `n_col` is greater than number of colours in palette.")

    palette <- palette[1:n_col]
    }

  if (reverse) palette <- rev(palette)

  palette_interpolator <- scales::as_continuous_pal(palette)
  palette_interpolator(seq(0, 1, by = (1/(n_steps - 1))))

}
