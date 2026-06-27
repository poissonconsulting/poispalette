
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

test_that("gradient scales forward n_steps to pois_pal_grad", {
  captured <- new.env()
  local_mocked_bindings(
    pois_pal_grad = function(palette, reverse, n_steps, n_col) {
      captured$n_steps <- n_steps
      c("#000000", "#FFFFFF")
    }
  )

  scale_colour_grad_poisson(n_steps = 17)
  expect_identical(captured$n_steps, 17)

  scale_fill_grad_poisson(n_steps = 42)
  expect_identical(captured$n_steps, 42)
})
