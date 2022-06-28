
test_that("scale functions produce objects", {
  scale <- scale_colour_disc_poisson()
  expect_identical(class(scale), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  
  scale <- scale_fill_disc_poisson()
  expect_identical(class(scale), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  
  scale <- scale_colour_grad_poisson("cool")
  expect_identical(class(scale), c("ScaleContinuous", "Scale", "ggproto", "gg"))
  
  scale <- scale_fill_grad_poisson("hot")
  expect_identical(class(scale), c("ScaleContinuous", "Scale", "ggproto", "gg"))
  
  scale <- scale_colour_disc_poisson("#000000")
  expect_identical(class(scale), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  
  scale <- scale_fill_disc_poisson("#000000")
  expect_identical(class(scale), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  
  scale <- scale_colour_grad_poisson(c("#000000", "#000000"))
  expect_identical(class(scale), c("ScaleContinuous", "Scale", "ggproto", "gg"))
  
  scale <- scale_fill_grad_poisson(c("#000000", "#000000"))
  expect_identical(class(scale), c("ScaleContinuous", "Scale", "ggproto", "gg"))
})


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

