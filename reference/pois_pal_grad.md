# Return interpolated color gradient for a continuous poisson colour palette

Return interpolated color gradient for a continuous poisson colour
palette

## Usage

``` r
pois_pal_grad(
  palette = "cool",
  reverse = FALSE,
  n_steps = 256,
  n_col = getOption("poispalette.n_col", NULL)
)
```

## Arguments

- palette:

  Character name of palette in pois_palettes, See
  [`pois_pal()`](https://poissonconsulting.github.io/poispalette/reference/pois_pal.md)
  for palette options.

- reverse:

  Boolean indicating whether the palette should be reversed

- n_steps:

  Number of steps in gradient

- n_col:

  Number of colours to subset from the palette (optional)

## Value

A character vector of `n_steps` interpolated hex colours.

## Examples

``` r
pois_pal_grad("cool", n_steps = 4)
#> [1] "#8EE7E6" "#00B4D8" "#0077B6" "#03045E"
```
