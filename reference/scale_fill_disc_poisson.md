# discrete fill scale constructor for poisson colours

discrete fill scale constructor for poisson colours

## Usage

``` r
scale_fill_disc_poisson(
  ...,
  palette = getOption("poispalette.colours", "discrete"),
  order = NULL,
  reverse = FALSE
)
```

## Arguments

- ...:

  Additional arguments passed to discrete_scale()

- palette:

  Character name of palette in pois_palettes

- order:

  A numeric or character vector indicating the order of colours in the
  palette. Can be a subset.

- reverse:

  Boolean indicating whether the palette should be reversed
