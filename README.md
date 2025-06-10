
<!-- README.md is generated from README.Rmd. Please edit that file -->

# poispalette

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R-CMD-check](https://github.com/poissonconsulting/poispalette/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/poispalette/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/poispalette/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/poispalette?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

## Introduction

`poispalette` is an R package that facilitates the use of Poisson
Consulting colour palettes in data plots and maps.

## Installation

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/poispalette)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/poispalette")
```

## Demonstration

Retrieve Poisson colours and palettes

``` r
library(poispalette)

pois_pal("discrete")
#>      black       blue        red     yellow     purple      green light blue 
#>  "#000000"  "#3063A3"  "#E8613C"  "#F7B500"  "#821C65"  "#63BB42"  "#90BDE5" 
#>     orchid       grey 
#>  "#D888CF"  "#7D7D7D"

pois_cols(c("red", "yellow"))
#>       red    yellow 
#> "#E8613C" "#F7B500"
```

Plot discrete scales

``` r
library(ggplot2)

ggplot2::ggplot(poispalette::points, aes(x = RandomX, y = RandomY)) +
  geom_point(aes(colour = ID), size = 2) +
  scale_colour_disc_poisson()
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

Plot gradient scales

``` r
ggplot2::ggplot(poispalette::points, aes(x = X, y = Y)) +
  geom_point(aes(colour = RandomX), size = 2) +
  scale_colour_grad_poisson(palette = "cool")
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/poispalette/issues).

[Pull requests](https://github.com/poissonconsulting/poispalette/pulls)
are always welcome.

## Code of Conduct

Please note that the poispalette project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
