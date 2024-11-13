library(shinytest2)

# Setup any PROXY setting here

test_that("Initial Shiny values are consistent", {
  my_app <- run_app() # store the app as shinyapp.obj
  app <- AppDriver$new(
    my_app,
    name = "basic-test",
    shiny_args = list(port = httpuv::randomPort()) # use random port
  )
  app$expect_values()
})
