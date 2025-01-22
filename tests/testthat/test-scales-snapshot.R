test_that("scale functions work with plots", {
  gp <- ggplot2::ggplot(poispalette::points, ggplot2::aes(x = RandomX, y = RandomY)) +
    ggplot2::geom_point(ggplot2::aes(colour = ID), size = 2) +
    scale_colour_disc_poisson()
  
  local_edition(3)
  expect_snapshot_plot(gp, "discrete_colours")
  
  gp <- ggplot2::ggplot(poispalette::points, ggplot2::aes(x = X, y = Y)) +
    ggplot2::geom_point(ggplot2::aes(colour = RandomX), size = 2) +
    scale_colour_grad_poisson(palette = c("#FF0000", "#00FF00"))
  
  expect_snapshot_plot(gp, "gradient_colours")
})

test_that("scale functions correctly display NA data values", {
  points_with_na_id <- poispalette::points[1:5, ]
  points_with_na_id$ID[5] <- NA
  
  gp <- ggplot2::ggplot(points_with_na_id, ggplot2::aes(x = RandomX, y = RandomY)) +
    ggplot2::geom_col(ggplot2::aes(colour = ID, fill = ID)) +
    scale_colour_disc_poisson() +
    scale_fill_disc_poisson()
  
  local_edition(3)
  expect_snapshot_plot(gp, "disc_pals_with_na")
  
  points_with_na_randx <- poispalette::points[1:5, ]
  points_with_na_randx$RandomX[5] <- NA
  
  gp <- ggplot2::ggplot(points_with_na_randx, ggplot2::aes(x = X, y = Y)) +
    ggplot2::geom_col(ggplot2::aes(colour = RandomX, fill = RandomX)) +
    scale_colour_grad_poisson() +
    scale_fill_grad_poisson()
  
  expect_snapshot_plot(gp, "grad_pals_with_na")
})

if(FALSE) {
  testthat::test_file(file.path(getwd(),"tests/testthat/test-scales-snapshot.R"))
  testthat::snapshot_review('scales-snapshot/')
}
