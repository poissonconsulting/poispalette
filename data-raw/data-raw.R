library(poispkgs)

pois_colours <-
      c("black" = "#000000",
        "legacy_red" = "#ff2500",
        "legacy_blue" = "#0433ff",
        "legacy_green" = "#008b00",
        "legacy_brown" = "#a52a2a",
        "legacy_gray" = "#707f90",
        "legacy_orchid" = "#da70d6",
        "legacy_lightblue" = "#87cefa",
        "legacy_aquamarine" = "#458b74",
        "legacy_orange" = "#cd8500",
        "legacy_purple" = "#a034f0",
        "cblind_orange" = "#D55E00",
        "cblind_blue" = "#0072B2",
        "cblind_green" = "#009E73",
        "cblind_mango" = "#E69F00",
        "cblind_yellow" = "#F0E442",
        "cblind_pink" = "#CC79A7",
        "cblind_lightblue" = "#56B4E9",
        "red" = "#E33307",
        "teal" = "#3088A3",
        "yellow" = "#FFD200",
        "purple" = "#6837A2",
        "blue" ="#254FB9",
        "green" = "#00B159")
    
pois_palettes <- list(
  legacy1 = c("black", "legacy_red", "legacy_blue", "legacy_green", "legacy_orange",
              "legacy_gray"),
  legacy2 = c("black", "legacy_red", "legacy_blue", "legacy_green", "legacy_orange",
              "legacy_gray", "legacy_purple"),
  legacy3 = c("black", "legacy_red", "legacy_blue", "legacy_green", "legacy_brown",
              "legacy_gray", "legacy_orchid", "legacy_lightblue","aquamarine",
              "legacy_orange"),
  colour_blind_1 = c("black", "cblind_orange", "cblind_blue", "cblind_green", "cblind_mango",
                   "cblind_yellow", "cblind_pink", "cblind_lightblue"),
  new_colours = c("black", "red", "teal", "yellow", "purple", "blue"),
  cool = c("blue", "green"),
  hot = c("red", "yellow"))

usethis::use_data(pois_colours, overwrite = TRUE)
usethis::use_data(pois_palettes, overwrite = TRUE)
