library(shiny)

dat <- reactive({
  filter_penguins_col(filter_val = 'female')
})

plot_params <- reactive({
  list(
    xvar = "body_mass_g",
    yvar = "flipper_length_mm",
    color = "species",
    shape = "species"
  )
})

testServer(mod_output_server, args = list(dat = dat, plot_params = plot_params),
 {
  out <- output$plot
   browser()
 })
