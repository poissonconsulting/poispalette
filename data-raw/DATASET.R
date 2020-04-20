library(readr)
points <- read_rds(paste0(getwd(), "/data-raw/points.rds"))
lines <- read_rds(paste0(getwd(), "/data-raw/lines.rds"))

usethis::use_data(points)
usethis::use_data(lines)
