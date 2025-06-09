test_that("make_palette_subsetter works", {
  expect_error(
    make_palette_subsetter(pois_cols())(20),
    "20 colours needed, but only 11 in chosen colour palette."
  )
})

test_that("chk_hex works", {
  expect_error(chk_hex("#12345G"), "Ivalid hex codes detected: #12345G.")
})

test_that("handling of ... args", {
  
  expect_identical(
    get_formals(ggplot2::discrete_scale, negate = "super"), 
    c("aesthetics", "palette", "name", "breaks", "labels", "limits", 
      "expand", "na.translate", "na.value", "drop", "guide", "position", 
      "call")
    )
  expect_error(get_formals(1, negate = "super"), "`fun` must be a function.")
  
  expect_identical(
    assign_dot_args(
      list("name", labels = c("a", "b"), 1:2),
      ggplot2::discrete_scale,
      c("aesthetics", "palette")
    ),
    list(name = "name", labels = c("a", "b"), breaks = 1:2)
  )
  
  expect_error(
    assign_dot_args(
      c("name"),
      ggplot2::discrete_scale,
      c("aesthetics", "palette")
    ),
    "`dot_args_user` must be a list."
  )
  
  expect_error(
    assign_dot_args(
      list("name"),
      ggplot2::discrete_scale,
      list("aesthetics", "palette")
    ),
    "`args_negate` must be atomic."
  )
  
})
