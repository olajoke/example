test_that("ggplot plot OK", {
  vdiffr::expect_doppelganger(
    "Penguins plot", 
    make_plot(
      filter_penguins_col(filter_val = "female"),
      "flipper_length_mm",
      "body_mass_g",
      "species",
      "species"
    )
  )
})
