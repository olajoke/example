#' output UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_output_ui <- function(id){
  ns <- NS(id)
  plotOutput(ns("plot"))
}
    
#' output Server Functions
#' 
#' @param dat Input data from the data module.
#'
#' @noRd 
mod_output_server <- function(id, dat, plot_params){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$plot <- renderPlot({
      Sys.sleep(2)
      make_plot(
        dat(),
        plot_params()$xvar,
        plot_params()$yvar,
        plot_params()$color,
        plot_params()$shape
      )
    })
  })
}
    
## To be copied in the UI
# mod_output_ui("output_1")
    
## To be copied in the server
# mod_output_server("output_1")
