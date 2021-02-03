#' Primary care network (PCN) shapefile
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
"pcn_shp"
