#' Plot helper
#'
#' @description A utils function to produce
#' ggplot from penguins data
#' @param dat Input data.
#' @param x_var, y_var, color, shape Passed to ggplot.
#'
#' @return A ggplot object.
#' @importFrom rlang .data
#' @importFrom ggplot2 ggplot aes geom_point
#' @noRd
make_plot <- function(dat, x_var, y_var, color, shape) {
  dat |>
    ggplot(
      aes(
        x = .data[[x_var]], 
        y = .data[[y_var]]
      )
    ) +
    geom_point(
      aes(
        color = .data[[color]], 
        shape = .data[[shape]]
      ), 
      size = 4
    )
}
