#' Load a dataset saved in `/data`. This function serves the `/datasets` API
#' endpoint in `inst/plumber/plumber.R` and is an internal function only. Note,
#' that datasets saved in `/data` are lazy loaded by default (i.e., they are
#' not accessible in memory until called).
#' @param dataset a character vector
#'
#' @noRd
#' @keywords internal
datasets <- function(dataset) {
  # Strip all "non-word" characters from user input for security
  sanitized_dataset <- gsub("\\W", "", dataset)

  if (length(sanitized_dataset) != 1) {
    stop(paste0(
      "Please supply only a single dataset, not ",
      length(sanitized_dataset), "."
    ))
  }
  if (!(sanitized_dataset %in% datasets_available())) {
    stop(paste0(
      "This dataset does not exist. Please see the `/datasets_available` ",
      "API enpoint for a list of valid options."
    ))
  }
  data(list = sanitized_dataset, package = "geographr")
  get(sanitized_dataset)
}

#' List available datasets in the geographr package. This function servers the
#' `/datasets_available` API endpoint in `inst/plumber/plumber.R` and is an
#' internal function only.
#'
#' @noRd
#' @keywords internal
datasets_available <- function() {
  data(package = "geographr")$results[, "Item"]
}

#' Run API
#'
#' @param ... Options passed to \code{plumber::plumb()$run()}
#' @examples
#' \dontrun{
#' run_api()
#' run_api(swagger = TRUE, port = 8000)
#' }
#' @return A running Plumber API
#' @export
run_api <- function(...) {
  plumber::plumb(
    dir = system.file("plumber", package = "geographr")
  )$run(...)
}
