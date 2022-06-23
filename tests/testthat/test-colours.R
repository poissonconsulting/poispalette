test_that("pois_cols works", {
  colours_fun <- pois_cols()[1:2]
  colours_data <- poispalette:::.pois_colours[1:2]
  expect_identical(colours_fun, colours_data)

  expect_error(pois_cols(cols = "not a colour"), "One or more values of cols not in pois_colours")
})

test_that("pois_pal_disc works", {
  palette <- pois_pal_disc(palette = "colours")(10)
  expect_identical(palette, pois_cols()[.pois_palettes$colours] %>% as.vector())
  
  palette <- pois_pal_disc(palette = "colours", reverse = TRUE)(10)
  expect_identical(palette, pois_cols()[.pois_palettes$colours] %>%
                     as.vector() %>% rev())
  
  expect_error(pois_pal_disc(palette = "not a palatte"), "Name of palette not found in `.pois_palettes`")
  expect_error(pois_pal_disc(palette = c("too", "many")), "Value of palette must be length 1")
})


test_that("pois_pal_grad works", {
  expect_error(pois_pal_grad(palette = "not a palette"), "Name of palette not found in `.pois_palettes`")
  expect_error(pois_pal_grad(palette = c("not", "colours")), "Colours in palette not found in `.pois_colours`")
})

test_that("functions produce scale objects", {
  scale <- scale_colour_disc_poisson()
  expect_identical(class(scale), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  
  scale <- scale_colour_grad_poisson("cool")
  expect_identical(class(scale), c("ScaleContinuous", "Scale", "ggproto", "gg"))
  
  scale <- scale_fill_grad_poisson("hot")
  expect_identical(class(scale), c("ScaleContinuous", "Scale", "ggproto", "gg"))
})
