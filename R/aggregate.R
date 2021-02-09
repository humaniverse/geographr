# ---- MSOA to PCN ----
# Borders are incongruent
# Use areal-weighted spatial interpolation
# Source: https://geocompr.robinlovelace.net/spatial-operations.html#spatial-aggr
msoa_pcn <- function(metric, extensive = TRUE) {
  sf::st_interpolate_aw(
    geographr::msoa_2011[, metric],
    geographr::pcn,
    extensive = extensive
  )
}

# Notes:
# - The above function will fail. The msoa_11 data set imported needs combining
#   with a metric that we wish to aggregate (e.g., vulnerability score)
# - Uncomment the dummy example below that uses the msoa_11 dataset with VI
#   scores appended. Ignore the warning errors and notice the new PCN
#   vulnerability scores that are calculated:
#
# library(tidyverse)
# library(sf)
#
# msoa_temp <-
#   read_sf("https://raw.githubusercontent.com/britishredcrosssociety/covid-19-vulnerability/master/output/vulnerability-MSOA-England.geojson") %>%
#   st_make_valid()
#
# st_interpolate_aw(
#   msoa_temp[, "Vulnerability.quintile"],
#   geographr::pcn,
#   extensive = FALSE
# )

# library(tidyverse)
# library(htmlwidgets)
# library(sf)
# library(leaflet)
# library(htmltools)
#
# # Create Title
# tag.map.title <- tags$style(HTML("
#   .leaflet-control.map-title {
#     transform: translate(-50%,20%);
#     position: fixed !important;
#     left: 50%;
#     text-align: center;
#     padding-left: 10px;
#     padding-right: 10px;
#     background: rgba(255,255,255,1);
#     font-weight: bold;
#     font-size: 22px;
#   }
# "))
#
# title <- tags$div(
#   tag.map.title, HTML("Exploe MSOA and PCN boundary overlaps")
# )
#
# map <-
#   leaflet(
#   options = leafletOptions(minZoom = 5, maxZoom = 15, attributionControl = F)
# ) %>%
#   setView(lat = 54.00366, lng = -2.547855, zoom = 7) %>%
#   addProviderTiles(providers$CartoDB.Positron) %>%
#   addMapPane("msoa", zIndex = 410) %>%
#   addMapPane("pcn", zIndex = 420) %>%
#   addPolygons(
#     data = geographr::msoa_2011,
#     fillColor = "#73aeea",
#     weight = 0.7,
#     opacity = 0.8,
#     color = "black",
#     dashArray = "2",
#     fillOpacity = 0.7,
#     options = pathOptions(pane = "msoa"),
#     highlight = highlightOptions(
#       weight = 5,
#       color = "#666",
#       dashArray = "",
#       fillOpacity = 0.7,
#       bringToFront = TRUE
#     ),
#     label = ~msoa_name,
#     group = "msoa"
#   ) %>%
#   addPolygons(
#     data = st_collection_extract(geographr::pcn, "POLYGON"),
#     fillColor = "#bb7ed7",
#     weight = 0.7,
#     opacity = 0.8,
#     color = "black",
#     dashArray = "2",
#     fillOpacity = 0.7,
#     options = pathOptions(pane = "pcn"),
#     highlight = highlightOptions(
#       weight = 5,
#       color = "#666",
#       dashArray = "",
#       fillOpacity = 0.7,
#       bringToFront = TRUE
#     ),
#     label = ~pcn_name,
#     group = "pcn"
#   ) %>%
#   addLayersControl(
#     overlayGroups = c("msoa", "pcn"),
#     options = layersControlOptions(collapsed = FALSE)
#   ) %>%
#   addControl(title, position = "topright", className="map-title")
#
# saveWidget(map, "misc/map.html")

# ---- MSOA to CCG ----
# # exploratory Leaflet map
# library(tidyverse)
# library(htmlwidgets)
# library(sf)
# library(leaflet)
# library(htmltools)
#
# # Create Title
# tag.map.title <- tags$style(HTML("
#   .leaflet-control.map-title {
#     transform: translate(-50%,20%);
#     position: fixed !important;
#     left: 50%;
#     text-align: center;
#     padding-left: 10px;
#     padding-right: 10px;
#     background: rgba(255,255,255,1);
#     font-weight: bold;
#     font-size: 22px;
#   }
# "))
#
# title <- tags$div(
#   tag.map.title, HTML("Exploe MSOA and CCG boundary overlaps")
# )
#
# map <-
#   leaflet(
#   options = leafletOptions(minZoom = 5, maxZoom = 15, attributionControl = F)
# ) %>%
#   setView(lat = 54.00366, lng = -2.547855, zoom = 7) %>%
#   addProviderTiles(providers$CartoDB.Positron) %>%
#   addMapPane("msoa", zIndex = 410) %>%
#   addMapPane("ccg", zIndex = 420) %>%
#   addPolygons(
#     data = geographr::msoa_2011,
#     fillColor = "#73aeea",
#     weight = 0.7,
#     opacity = 0.8,
#     color = "black",
#     dashArray = "2",
#     fillOpacity = 0.7,
#     options = pathOptions(pane = "msoa"),
#     highlight = highlightOptions(
#       weight = 5,
#       color = "#666",
#       dashArray = "",
#       fillOpacity = 0.7,
#       bringToFront = TRUE
#     ),
#     label = ~msoa_name,
#     group = "msoa"
#   ) %>%
#   addPolygons(
#     data = geographr::ccg,
#     fillColor = "#bb7ed7",
#     weight = 0.7,
#     opacity = 0.8,
#     color = "black",
#     dashArray = "2",
#     fillOpacity = 0.7,
#     options = pathOptions(pane = "ccg"),
#     highlight = highlightOptions(
#       weight = 5,
#       color = "#666",
#       dashArray = "",
#       fillOpacity = 0.7,
#       bringToFront = TRUE
#     ),
#     label = ~ccg_name,
#     group = "ccg"
#   ) %>%
#   addLayersControl(
#     overlayGroups = c("msoa", "ccg"),
#     options = layersControlOptions(collapsed = FALSE)
#   ) %>%
#   addControl(title, position = "topright", className="map-title")
#
# saveWidget(map, "misc/msoa_ccg_map.html")
