# poisson colours

poisson colours

## Usage

``` r
pois_cols(colours = NULL)
```

## Arguments

- colours:

  Character names of Poisson colours

## Value

A named character vector of hex colours

## Examples

``` r
pois_cols()
#>      black       blue        red     yellow     purple      green light blue 
#>  "#000000"  "#3063A3"  "#E8613C"  "#F7B530"  "#821C65"  "#63BB42"  "#90BDE5" 
#>     orchid       grey    crimson 
#>  "#D888CF"  "#7D7D7D"  "#A7061E" 
pois_cols(c("red", "yellow"))
#>       red    yellow 
#> "#E8613C" "#F7B530" 
```
