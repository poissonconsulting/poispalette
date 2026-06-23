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

  Character name of palette in pois_palettes, See `pos_pal()` for
  palette options.

- reverse:

  Boolean indicating whether the palette should be reversed

- n_steps:

  Number of steps in gradient

- n_col:

  Number of colours to subset from the palette (optional)
