test_that("test filters ", {
  expect_error(filter_penguins_col(col = 'bla', filter_val = "female"))
  expect_s3_class(filter_penguins_col(filter_val = "female"), "data.frame")
  unique_sex_col  <- filter_penguins_col(filter_val = "female")  |> pull(sex)  |> unique()
  expect_identical(as.character((unique_sex_col)), "female")
})
