#' Filter data helper
#'
#' @description A utils function filter penguins data
#' @param col Colummn to filter. Defaults to sex.
#' @param filter_val Filter value.
#'
#' @return A tibble.
#' @importFrom rlang .data
#' @import dplyr
#' @noRd
filter_penguins_col <- function(col = "sex", filter_val) {

  dat <- palmerpenguins::penguins
  stopifnot(col %in% colnames(dat))

  dat |>
    filter(.data[[col]] == filter_val)
}

#' @keywords internal
slow_func <- function(n) {
  vec <- NULL # Or vec = c()
  for (i in seq_len(n))
    vec <- c(vec, i)
  vec
}