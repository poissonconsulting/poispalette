test_that("make_palette_subsetter works", {
  expect_error(
    make_palette_subsetter(pois_cols())(20),
    "20 colours needed, but only 11 in chosen colour palette."
  )
})

test_that("chk_hex works", {
  expect_error(chk_hex("#12345G"), "Ivalid hex codes detected: #12345G.")
})
