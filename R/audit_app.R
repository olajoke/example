## File: R/audit-app.R
record_loadtest <- function(app = run_app(), timeout = 15, workers = 5) {
  message("\n---- BEGIN LOAD-TEST ---- \n")
  # start app + recorder
  target <- start_r_bg(shiny_bg, app = app)
  recorder <- start_r_bg(recorder_bg)

  # start headless chrome (points to recorder!).
  # AppDriver also support remote urls.
  app <- shinytest2::AppDriver$new(
    "http://127.0.0.1:8600",
    load_timeout = timeout * 1000
  )

  app$set_inputs(
    `data_1-filter` = "male",
    `data_1-xvar` = "bill_length_mm",
    `data_1-yvar` = "body_mass_g",
    `data_1-color` = "island",
    timeout_ = timeout * 1000)

  # clean
  app$stop()
  # needed to avoid
  # java.lang.IllegalStateException: last event in log not a
  # WS_CLOSE (did you close the tab after recording?)
  Sys.sleep(2)

  # shinycannon (maybe expose other params later ...)
  target_url <- "http://127.0.0.1:3515"
  system(
    sprintf(
      "shinycannon recording.log %s --workers %s --loaded-duration-minutes 2 --output-dir run1",
      target_url, workers
    )
  )

  target$kill()

  # Treat data and generate report
  df <- shinyloadtest::load_runs("run1")
  shinyloadtest::shinyloadtest_report(
    df,
    "public/index.html",
    self_contained = TRUE,
    open_browser = FALSE
  )
}