# Gradient fill scale constructor for poisson colours

Gradient fill scale constructor for poisson colours

## Usage

``` r
scale_fill_grad_poisson(
  ...,
  palette = getOption("poispalette.gradient", "cool"),
  reverse = FALSE,
  n_steps = 256,
  n_col = getOption("poispalette.n_col", NULL)
)
```

## Arguments

- ...:

  Additional arguments passed to scale_color_gradientn()

- palette:

  Character name of palette in pois_palettes, or selection of colour
  names from pois_cols

- reverse:

  Boolean indicating whether the palette should be reversed

- n_steps:

  Number of steps in gradient

- n_col:

  Number of colours to subset from the palette (optional)

## Value

A ggplot2 continuous scale.

## Examples

``` r
library(ggplot2)
ggplot(points, aes(X, Y, fill = RandomX)) +
  geom_point(shape = 21) +
  scale_fill_grad_poisson(palette = "cool")
```
