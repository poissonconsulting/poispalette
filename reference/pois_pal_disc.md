# Return function to subset poisson colour palette

Return function to subset poisson colour palette

## Usage

``` r
pois_pal_disc(palette = "discrete", order = NULL, reverse = FALSE)
```

## Arguments

- palette:

  Character name of palette. See
  [`pois_pal()`](https://poissonconsulting.github.io/poispalette/reference/pois_pal.md)
  for palette options.

- order:

  A numeric or character vector indicating the order of colours in the
  palette. Can be a subset.

- reverse:

  Boolean indicating whether the palette should be reversed

## Value

A function that takes the number of colours required and returns a
character vector of that many hex colours from the palette.

## Examples

``` r
pois_pal_disc("discrete")(3)
#> [1] "#000000" "#3063A3" "#E8613C"
```
