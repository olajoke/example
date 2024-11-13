#' data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_data_ui <- function(id){
  ns <- NS(id)

  penguins <- palmerpenguins::penguins
  tagList(
    selectInput(
      ns("filter"), 
      "Sex", 
      unique(penguins$sex),
      "female"
    ),
    selectInput(
      ns("xvar"), 
      "X var", 
      colnames(dplyr::select(penguins, where(is.numeric))),
      "body_mass_g"
    ),
    selectInput(
      ns("yvar"),
      "Y var",
      colnames(dplyr::select(penguins, where(is.numeric))),
      "flipper_length_mm"
    ),
    selectInput(
      ns("color"),
      "Color and shape",
      colnames(dplyr::select(penguins, where(is.factor))),
      "species"
    )
  )
}
    
#' data Server Functions
#'
#' @noRd 
mod_data_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    filtered_data <- reactive({
      filter_penguins_col(filter_val = input$filter)
    })

    plot_params <- reactive({
      list(
        xvar = input$xvar,
        yvar = input$yvar,
        color = input$color,
        shape = input$color
      )
    })

    list(
      data = filtered_data,
      plot_params = plot_params
    )
  })
}
    
## To be copied in the UI
# mod_data_ui("data_1")
    
## To be copied in the server
# mod_data_server("data_1")
