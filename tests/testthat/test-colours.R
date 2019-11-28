context("colours")

test_that("pois_cols works",{
  colours_fun <- pois_cols()[1:2]
  colours_data <- poispalette::pois_colours[1:2]

  expect_identical(colours_fun, colours_data)
})

test_that("pois_pal works",{
  palette <- pois_pal("cool")(4)

  expect_identical(palette, c("#0000FF", "#0055AA", "#00AA55", "#00FF00"))
})



