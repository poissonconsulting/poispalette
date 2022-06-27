test_that("pois_cols works", {
  colours_fun <- pois_cols()[1:2]
  colours_data <- poispalette:::.pois_colours[1:2]
  expect_identical(colours_fun, colours_data)
  
  expect_error(pois_cols(colours = "not a colour"),
               "One or more values of colours not in .pois_colours")
})

test_that("chk_hex works", {
  
  good <- c("#112233", "#FFEEDD")
  expect_identical(chk_hex(good), good)
  
  bad <- c("112233", "#FFEEDDD", "#FFEEDDX", "#112233")
  expect_error(
    chk_hex(bad),
    "Ivalid hex codes detected: 112233, #FFEEDDD, #FFEEDDX."
    )
})

test_that("pois_pal_disc works", {
  palette <- pois_pal_disc(palette = "discrete")(10)
  expect_identical(palette, pois_cols() |> as.vector())
  
  palette <- pois_pal_disc(palette = "discrete", reverse = TRUE)(10)
  expect_identical(palette, pois_cols() %>% as.vector() %>% rev())
  
  expect_error(
    pois_pal_disc(palette = "not a palatte"),
    "Name of palette not found in `.pois_palettes`"
    )
  expect_error(
    pois_pal_disc(palette = c("too", "many")),
    "Value of palette must be length 1"
    )
})

test_that("pois_pal_grad works", {
  expect_error(
    pois_pal_grad(palette = "not a palette"),
    "Name of palette not found in `.pois_palettes`"
    )
  expect_error(
    pois_pal_grad(palette = c("not", "colours")),
    "Ivalid hex codes detected: not, colours."
    )
  
  expect_identical(
    pois_pal_grad("cool")[1:12],
    c("#caf0f8", "#c8eff8", "#c5eff7", "#c3eef7", "#c1edf6", "#bfedf6", 
    "#bdecf6", "#baebf5", "#b8eaf5", "#b6eaf4", "#b4e9f4", "#b2e8f4")
    )

  expect_identical(
    pois_pal_grad("cool", n_col = 2)[1:12],
    c("#caf0f8", "#caf0f8", "#caf0f8", "#c9f0f8", "#c9f0f8", "#c9f0f8", 
      "#c9f0f8", "#c9f0f8", "#c8f0f8", "#c8eff8", "#c8eff8", "#c8eff8")
  )

  expect_identical(
    pois_pal_grad("cool", n_steps = 12),
    c("#caf0f8", "#99dfef", "#69cce5", "#28b8da", "#0ba2cd", "#158abf", 
      "#1973af", "#1b5d9f", "#1a478f", "#16327f", "#0f1c6e", "#03045e")
  )

})
