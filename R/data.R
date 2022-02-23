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

#' Clinical Commissioning Groups (April 2021)
#'
#' A data set containing 2021 Clinical Commissioning Group (CCG) geometries and
#' their associated names and codes. Boundaries are ultra generalised (500m).
#'
#' @format A data frame of class "sf" with 106 rows and 3 variables:
#' \describe{
#'   \item{ccg_21_name}{CCG name}
#'   \item{ccg_21_code}{CCG code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_ccg_21"