#' Countries (December 2020)
#'
#' A data set containing 2020 Country geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 4 rows and 3 variables:
#' \describe{
#'   \item{country_20_name}{country name}
#'   \item{country_20_code}{Country code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_countries_20"