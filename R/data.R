#' Primary care networks
#'
#' A data set containing primary care network geometries calculated using their
#' member GP practices.
#'
#' @format A data frame of class "sf" with 1,278 rows and 3 variables:
#' \describe{
#'   \item{pcn_code}{PCN code}
#'   \item{pcn_name}{PCN name}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://digital.nhs.uk/}
"pcn"

#' Middle super output areas (2011)
#'
#' A data set containing 2011 middle super output area (MSOA) geometries and
#' their associated names and codes.
#'
#' @format A data frame of class "sf" with 6,791 rows and 3 variables:
#' \describe{
#'   \item{msoa_code}{MSOA code}
#'   \item{msoa_name}{MSOA name}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"msoa_2011"
