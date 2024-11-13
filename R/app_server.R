#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  res <- mod_data_server("data_1")
  mod_output_server("output_1", res$data, res$plot_params)
}
