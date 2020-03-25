library(readr)
points <- read_rds("~/Poisson/Data/poispallete/example data/points.rds")
lines <- read_rds("~/Poisson/Data/poispallete/example data/lines.rds")

usethis::use_data(points)
usethis::use_data(lines)

