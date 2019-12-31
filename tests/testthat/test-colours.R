context("colours")

test_that("pois_cols works",{
  colours_fun <- pois_cols()[1:2]
  colours_data <- poispalette::pois_colours[1:2]
  expect_identical(colours_fun, colours_data)
  
  expect_error(pois_cols(cols = "not a colour"), "One or more values of cols not in pois_colours")
})

test_that("pois_pal works",{
  palette <- pois_pal("cool")(4)
  expect_identical(palette, c("#0000FF", "#0055AA", "#00AA55", "#00FF00"))
  
  expect_error(pois_pal(palette = "not a palatte"), "Value of palette not found in pois_palettes")
  expect_error(pois_pal(palette = c("too", "many")), "Value of palette must be length 1")
})

test_that("scale_colour_pois / scale_fill_pois works",{
  scale <- scale_colour_pois("cool")
  expect_identical(class(scale), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  
  scale <- scale_fill_pois("cool")
  expect_identical(class(scale), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
})
