% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scales.R
\name{scale_fill_grad_poisson}
\alias{scale_fill_grad_poisson}
\title{Gradient fill scale constructor for poisson colours}
\usage{
scale_fill_grad_poisson(
  ...,
  palette = getOption("poispalette.gradient", "cool"),
  reverse = FALSE,
  n_steps = 256,
  n_col = getOption("poispalette.n_col", NULL)
)
}
\arguments{
\item{...}{Additional arguments passed to scale_color_gradientn()}

\item{palette}{Character name of palette in pois_palettes, or selection
of colour names from pois_cols}

\item{reverse}{Boolean indicating whether the palette should be reversed}

\item{n_steps}{Number of steps in gradient}

\item{n_col}{Number of colours to subset from the palette (optional)}
}
\description{
Gradient fill scale constructor for poisson colours
}
