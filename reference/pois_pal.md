# poisson palettes

poisson palettes

## Usage

``` r
pois_pal(palette = NULL)
```

## Arguments

- palette:

  Character names of Poisson palettes. One of 'discrete', 'hot', 'cool'.

## Value

A named character vector of hex colours

## Examples

``` r
pois_pal()
#>      black       blue        red     yellow     purple      green light blue 
#>  "#000000"  "#3063A3"  "#E8613C"  "#F7B530"  "#821C65"  "#63BB42"  "#90BDE5" 
#>     orchid       grey    crimson 
#>  "#D888CF"  "#7D7D7D"  "#A7061E" 
pois_pal("cool")
#> [1] "#8EE7E6" "#00B4D8" "#0077B6" "#03045E"
```
