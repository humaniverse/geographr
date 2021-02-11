#' Primary care networks
#'
#' A data set containing Primary Care Network (PCN) geometries calculated using
#' their member GP practices.
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

#' Clinical Commissioning Groups (April 2020)
#'
#' A data set containing 2020 Clinical Commissioning Group (CCG) geometries and
#' their associated names and codes. Boundaries are ultra generalised (500m).
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
#' (STP) geometries and their associated names and codes. Boundaries are ultra
#' generalised (500m).
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


#' Middle Super Output Areas (2011)
#'
#' A data set containing 2011 Middle Super Output Area (MSOA) geometries and
#' their associated names and codes. Full clipped boundaries were simplified
#' using the Visvalingam algorithm set to a weighting of 0.7 with a retaining
#' proportion of 0.05 points.
#'
#' @format A data frame of class "sf" with 7,201 rows and 3 variables:
#' \describe{
#'   \item{msoa_code}{MSOA code}
#'   \item{msoa_name}{MSOA name}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"msoa"

#' Local Authority Districts (December 2019)
#'
#' A data set containing 2019 Local Authority Districts (LAD) geometries and
#' their associated names and codes. Boundaries are ultra generalised (500m).
#'
#' @format A data frame of class "sf" with 382 rows and 3 variables:
#' \describe{
#'   \item{lad_code}{LAD code}
#'   \item{lad_name}{LAD name}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lad"

#' Wards / Electoral Divisions (December 2020)
#'
#' A data set containing 2020 Ward / Electoral Division geometries and their
#' associated names and codes. Boundaries are Super generalised (200m) - clipped
#' to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 8,887 rows and 3 variables:
#' \describe{
#'   \item{ward_code}{ward code}
#'   \item{ward_name}{ward name}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"wards"

#' Major Towns and Cities (December 2015)
#'
#' A data set containing 2015 Major Town and City (December 2015) geometries
#' and their associated names and codes. Boundaries are Super generalised (200m)
#' - clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 112 rows and 3 variables:
#' \describe{
#'   \item{town_city_name}{town and city name}
#'   \item{town_city_code}{town and city code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"towns_cities"

#' Counties and Unitary Authorities (December 2019)
#'
#' A data set containing 2019 County and Unitary Authority (UA) geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 216 rows and 3 variables:
#' \describe{
#'   \item{county_ua_name}{county and UA name}
#'   \item{county_ua_code}{county and UA code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"counties_ua"
