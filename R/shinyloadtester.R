# Main shiny app
shiny_bg <- function(app, port) {
  options(shiny.port = port)
  app
}

# Start recorder
recorder_bg <- function(port) {
  shinyloadtest::record_session(
    target_app_url = sprintf("http://127.0.0.1:%s", port),
    host = "127.0.0.1",
    port = 8600,
    output_file = "recording.log",
    open_browser = FALSE
  )
}

start_r_bg <- function(fun, app = NULL, port = 3515) {

  # remove NULL elements
  args <- Filter(Negate(is.null), list(app = app, port = port))

  process <- callr::r_bg(
    func = fun,
    args = args,
    stderr= "",
    stdout = ""
  )

  while (any(is.na(pingr::ping_port("127.0.0.1", 3515)))) {
    message("Waiting for Shiny app to start...")
    Sys.sleep(0.1)
  }

  attempt::stop_if_not(
    process$is_alive(),
    msg = "Unable to launch the subprocess"
  )

  process
}