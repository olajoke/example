testServer(
  mod_data_server,
  expr = {
    session$setInputs(
      filter = "female",
      xvar = "body_mass_g",
      yvar = "flipper_length_mm",
      color = "species"
    )

    # Check returned
    res <- session$returned
    expect_named(res, c("data", "plot_params"))
    expect_identical(res$data(), filtered_data())
    expect_identical(res$plot_params(), plot_params())

    # Check filtered_data reactive
    expect_s3_class(filtered_data(), "data.frame")

    # Check plot_params reactive
    expect_identical(plot_params()$xvar, "body_mass_g")
    expect_identical(plot_params()$yvar, "flipper_length_mm")
    expect_identical(plot_params()$color, "species")
    expect_identical(plot_params()$shape, "species")
  }
)
