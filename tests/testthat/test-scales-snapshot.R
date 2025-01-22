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

if(FALSE) {
  testthat::test_file(file.path(getwd(),"tests/testthat/test-scales-snapshot.R"))
  testthat::snapshot_review('scales-snapshot/')
}

