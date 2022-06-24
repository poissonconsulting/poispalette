test_that("pois_cols works", {
  colours_fun <- pois_cols()[1:2]
  colours_data <- poispalette:::.pois_colours[1:2]
  expect_identical(colours_fun, colours_data)
  
  expect_error(pois_cols(cols = "not a colour"), "One or more values of cols not in pois_colours")
})

test_that("chk_hex works", {
  
  good <- c("#112233", "#FFEEDD")
  expect_identical(chk_hex(good), good)
  
  bad <- c("112233", "#FFEEDDD", "#FFEEDDX", "#112233")
  expect_error(chk_hex(bad), "Ivalid hex codes detected: 112233, #FFEEDDD, #FFEEDDX.")
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