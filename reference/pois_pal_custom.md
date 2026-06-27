# Return function to subset a user provided colour palette

Return function to subset a user provided colour palette

## Usage

``` r
pois_pal_custom(palette, order = NULL, reverse = FALSE)
```

## Arguments

- palette:

  Character vector of hex colours.

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
pois_pal_custom(c("#1E6091", "#D9ED92", "#99D98C"))(3)
#> [1] "#1E6091" "#D9ED92" "#99D98C"
```
