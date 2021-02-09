#' Primary care networks
#'
#' A data set containing Primary Care Network (PCN) geometries calculated using their
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

#' Middle Super Output Areas (2011)
#'
#' A data set containing 2011 Middle Super Output Area (MSOA) geometries and
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

#' Clinical Commissioning Groups (April 2020)
#'
#' A data set containing 2020 Clinical Commissioning Group (CCG) geometries and
#' their associated names and codes.
#'
#' @format A data frame of class "sf" with 135 rows and 3 variables:
#' \describe{
#'   \item{ccg_code}{CCG code}
#'   \item{ccg_name}{CCG name}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"ccg"

#' Sustainability and Transformation Partnerships (April 2020)
#'
#' A data set containing 2020 Sustainability and Transformation Partnerships
#' (STP) geometries and their associated names and codes.
#'
#' @format A data frame of class "sf" with 42 rows and 3 variables:
#' \describe{
#'   \item{stp_code}{STP code}
#'   \item{stp_name}{STP name}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"stp"
