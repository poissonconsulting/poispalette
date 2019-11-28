library(poispkgs)

pois_colours <- 
      c("black" = "#000000",
        "red" = "#ff2500",
        "blue" = "#0433ff",
        "green4" = "#008b00",
        "brown" = "#a52a2a",
        "slategray" = "#707f90",
        "orchid" = "#da70d6",
        "lightskyblue" = "#87cefa",
        "aquamarine4" = "#458b74",
        "orange3" = "#cd8500",
        "purple" = "#a034f0")

pois_palettes <- list(
  cool = c("blue", "green"),
  hot = c("orange3", "red"),
  p1 = c("black", "red", "blue", "green4", "orange3", "slategray"),
  p2 = c("black", "red", "blue", "green4", "orange3","slategray", "purple"),
  p3 = c("black", "red", "blue", "green4", "brown", "slategray", "orchid",
         "lightskyblue","aquamarine4", "orange3"))

usethis::use_data(pois_colours, overwrite = TRUE)
usethis::use_data(pois_palettes, overwrite = TRUE)
