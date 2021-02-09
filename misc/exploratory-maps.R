# ---- MSOA to PCN ----
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

# ---- MSOA to CCG ----
library(tidyverse)
library(htmlwidgets)
library(sf)
library(leaflet)
library(htmltools)

# Create Title
tag.map.title <- tags$style(HTML("
  .leaflet-control.map-title {
    transform: translate(-50%,20%);
    position: fixed !important;
    left: 50%;
    text-align: center;
    padding-left: 10px;
    padding-right: 10px;
    background: rgba(255,255,255,1);
    font-weight: bold;
    font-size: 22px;
  }
"))

title <- tags$div(
  tag.map.title, HTML("Exploe MSOA and STP boundary overlaps")
)

map <-
  leaflet(
  options = leafletOptions(minZoom = 5, maxZoom = 15, attributionControl = F)
) %>%
  setView(lat = 54.00366, lng = -2.547855, zoom = 7) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addMapPane("msoa", zIndex = 410) %>%
  addMapPane("stp", zIndex = 420) %>%
  addPolygons(
    data = geographr::msoa_2011,
    fillColor = "#73aeea",
    weight = 0.7,
    opacity = 0.8,
    color = "black",
    dashArray = "2",
    fillOpacity = 0.7,
    options = pathOptions(pane = "msoa"),
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE
    ),
    label = ~msoa_name,
    group = "msoa"
  ) %>%
  addPolygons(
    data = geographr::stp,
    fillColor = "#bb7ed7",
    weight = 0.7,
    opacity = 0.8,
    color = "black",
    dashArray = "2",
    fillOpacity = 0.7,
    options = pathOptions(pane = "stp"),
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE
    ),
    label = ~stp_name,
    group = "stp"
  ) %>%
  addLayersControl(
    overlayGroups = c("msoa", "stp"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  addControl(title, position = "topright", className="map-title")

saveWidget(map, "misc/msoa_stp_map.html")
