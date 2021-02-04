# ---- MSOA to PCN ----
# Borders are incongruent
# Use areal-weighted spatial interpolation
# Source: https://geocompr.robinlovelace.net/spatial-operations.html#spatial-aggr
msoa_pcn <- function(metric, extensive = TRUE) {
  sf::st_interpolate_aw(
    geographr::msoa_11[, metric],
    geographr::pcn,
    extensive = extensive
  )
}

msoa_temp <-
  read_sf("https://raw.githubusercontent.com/britishredcrosssociety/covid-19-vulnerability/master/output/vulnerability-MSOA-England.geojson") %>%
  st_make_valid()

sf::st_interpolate_aw(
  msoa_temp[, "Vulnerability.quintile"],
  sf::st_make_valid(geographr::pcn),
  extensive = FALSE
)
