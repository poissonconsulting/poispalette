
test_that("scale functions produce objects", {
  scale <- scale_colour_disc_poisson()
  expect_identical(class(scale), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  
  scale <- scale_fill_disc_poisson()
  expect_identical(class(scale), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  
  scale <- scale_colour_grad_poisson(palette = "cool")
  expect_identical(class(scale), c("ScaleContinuous", "Scale", "ggproto", "gg"))
  
  scale <- scale_fill_grad_poisson(palette = "hot")
  expect_identical(class(scale), c("ScaleContinuous", "Scale", "ggproto", "gg"))
  
  scale <- scale_colour_disc_poisson(palette = "#000000")
  expect_identical(class(scale), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  
  scale <- scale_fill_disc_poisson(palette = "#000000")
  expect_identical(class(scale), c("ScaleDiscrete", "Scale", "ggproto", "gg"))
  
  scale <- scale_colour_grad_poisson(palette = c("#000000", "#000000"))
  expect_identical(class(scale), c("ScaleContinuous", "Scale", "ggproto", "gg"))
  
  scale <- scale_fill_grad_poisson(palette = c("#000000", "#000000"))
  expect_identical(class(scale), c("ScaleContinuous", "Scale", "ggproto", "gg"))
})
