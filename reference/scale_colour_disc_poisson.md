# discrete colour scale constructor for poisson colours

discrete colour scale constructor for poisson colours

## Usage

``` r
scale_colour_disc_poisson(
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

## Value

A ggplot2 discrete scale.

## Examples

``` r
library(ggplot2)
ggplot(points, aes(RandomX, RandomY, colour = ID)) +
  geom_point() +
  scale_colour_disc_poisson()
```
