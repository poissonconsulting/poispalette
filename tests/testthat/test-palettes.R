test_that("pois_cols works", {
  expect_identical(pois_cols(), poispalette:::.pois_colours)
  
  expect_identical(pois_cols(c("black", "blue")), poispalette:::.pois_colours[1:2])
  
  expect_error(pois_cols(colours = "not a colour"),
               "One or more values of colours not in .pois_colours")
})

test_that("pois_pal works", {
  expect_identical(pois_pal(), pois_cols()[1:10])
  
  expect_error(
    pois_pal("not a pal"),
    "One or more values of palette not in .pois_palettes."
    )
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
  expect_identical(
    palette,
    pois_cols()[1:10] |> as.vector()
  )
  
  palette <- pois_pal_disc(palette = "discrete", reverse = TRUE)(10)
  expect_identical(
    palette,
    pois_cols()[1:10] |> as.vector() %>% rev()
    )
  
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
  
  expect_error(
    pois_pal_grad(palette = "cool", n_col = 10),
    "Argument `n_col` is greater than number of colours in palette."
  )
  
  expect_error(
    pois_pal_grad(palette = "cool", n_col = 1),
    "Argument `n_col` must be 2 or greater."
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
  
  expect_identical(
    pois_pal_grad("cool", reverse = TRUE)[1:12],
    c("#03045e", "#04055f", "#04065f", "#050760", "#050861", "#060962", 
      "#060b62", "#070c63", "#070d64", "#080e64", "#080f65", "#091066")
  )
})

test_that("pois_pal_custom works", {
  palette <- pois_pal_custom(c("#1E6091", "#D9ED92", "#99D98C"))(3)
  expect_identical(
    palette,
    c("#1E6091", "#D9ED92", "#99D98C")
  )
  
  palette <- pois_pal_custom(c("#1E6091", "#D9ED92", "#99D98C"), reverse = TRUE)(3)
  expect_identical(
    palette,
    c("#99D98C", "#D9ED92", "#1E6091")
  )
  
})

test_that("test that 'order' arg in palette functions works", {
 
  palette <- pois_pal_disc(order = c("red", "blue", "yellow"))(10)
  expect_identical(
    palette,
    c("#E84D22", "#053296", "#F7B500", "#000000", "#00706C", "#821C65",
      "#63BB42", "#90BDE5", "#D888CF", "#7D7D7D")
    )
  
  palette <- pois_pal_disc(order = c(3, 2, 4))(10)
  expect_identical(
    palette,
    c("#E84D22", "#053296", "#F7B500", "#000000", "#00706C", "#821C65",
      "#63BB42", "#90BDE5", "#D888CF", "#7D7D7D")
  )
  
  custom_cols <- c("#03045e", "#04055f", "#04065f", "#050760", "#050861")
  palette <- pois_pal_custom(custom_cols, order = c("#04065f", "#050760", "#050861"))(5)
  expect_identical(
    palette,
    c("#04065f", "#050760", "#050861", "#03045e", "#04055f")
  )
  
  expect_error(
    pois_pal_disc(order = c("bed", "blue", "yellow")),
    "All colours in `order` must match colour names in palette `discrete`."
  )

  expect_error(
    pois_pal_disc(order = c(TRUE)),
    "At least one of the following conditions must be met:"
  )
  
  expect_error(
    pois_pal_disc(order = c(TRUE)),
    "At least one of the following conditions must be met:"
  )
  
  expect_error(
    pois_pal_disc(order = 1:11)(10),
    "All values of order must be within the range 1 - 10."
  )
  
})