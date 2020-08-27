context("colours")

test_that("pois_cols works", {
  colours_fun <- pois_cols()[1:2]
  colours_data <- poispalette:::.pois_colours[1:2]
  expect_identical(colours_fun, colours_data)

  expect_error(pois_cols(cols = "not a colour"), "One or more values of cols not in pois_colours")
})

test_that("pois_pal_disc works", {
  palette <- pois_pal_disc(palette = "colours")(9)
  
  expect_identical(palette, c("#000000", "#00706C", "#E84D22", "#F7B500", "#821C65",
                              "#63BB42", "#90BDE5", "#D888CF", "#7D7D7D"))

  palette <- pois_pal_disc(palette = "colours", reverse = TRUE)(9)
  expect_identical(palette, c("#7D7D7D", "#D888CF", "#90BDE5", "#63BB42", "#821C65",
                              "#F7B500", "#E84D22", "#00706C", "#000000"))
  
  expect_error(pois_pal_disc(palette = "not a palatte"), "Name of palette not found in `.pois_palettes`")
  expect_error(pois_pal_disc(palette = c("too", "many")), "Value of palette must be length 1")
})


test_that("pois_pal_grad works", {
  palette <- pois_pal_grad(palette = "cool")
  
  expect_identical(palette[1:9], c("#759dbe", "#759cbe", "#759cbe", "#749bbe", "#749bbe",
                              "#749abd", "#749abd", "#7499bd", "#7398bd"))
  
  palette <- pois_pal_grad(palette = "cool", reverse = TRUE)
  
  expect_identical(palette[1:9], c("#00009f", "#02019f", "#04029f", "#06039f", "#0804a0",
                              "#0b05a0", "#0d06a0", "#0e07a0", "#1008a0"))
  
  expect_error(pois_pal_grad(palette = "not a palette"), "Name of palette not found in `.pois_palettes`")
  expect_error(pois_pal_grad(palette = c("not", "colours")), "Colours in palette not found in `.pois_colours`")
})

test_that("functions produce scale objects", {
  scale <- scale_colour_disc_poisson()
  expect_identical(class(scale), c("ScaleDiscrete", "Scale", "ggproto", "gg"))

  scale <- scale_fill_disc_poisson("legacy")
  expect_identical(class(scale), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  
  scale <- scale_colour_grad_poisson("cool")
  expect_identical(class(scale), c("ScaleContinuous", "Scale", "ggproto", "gg"))
  
  scale <- scale_fill_grad_poisson("hot")
  expect_identical(class(scale), c("ScaleContinuous", "Scale", "ggproto", "gg"))
  
})
