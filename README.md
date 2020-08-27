
<!-- README.md is generated from README.Rmd. Please edit that file -->

# poispalette

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R build
status](https://github.com/poissonconsulting/poispalette/workflows/R-CMD-check/badge.svg)](https://github.com/poissonconsulting/poispalette/actions)
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

To install the latest developmental release from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

``` r
# install.packages("drat")
drat::addRepo("poissonconsulting")
install.packages("poispalette")
```

## Demonstration

``` r
library(ggplot2)
library(poispalette)

ggplot(poispalette::points, aes(x = RandomX, y = RandomY)) +
  geom_point(aes(colour = ID), size = 2) +
  poispalette::scale_colour_disc_poisson()
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r

ggplot(poispalette::points, aes(x = X)) +
  geom_histogram(aes(fill = ID), binwidth = 30) +
  poispalette::scale_fill_disc_poisson()
```

<img src="man/figures/README-example-2.png" width="100%" />

``` r

ggplot(poispalette::lines, aes(x = DateTimeData, y = Value)) +
  geom_line(aes(colour = ID), size = 2) +
  poispalette::scale_colour_disc_poisson(palette = "legacy")
```

<img src="man/figures/README-example-3.png" width="100%" />

``` r

ggplot(poispalette::points, aes(x = X, y = Y)) +
  geom_point(aes(colour = RandomX), size = 2) +
  poispalette::scale_colour_grad_poisson(palette = "cool")
```

<img src="man/figures/README-example-4.png" width="100%" />

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
