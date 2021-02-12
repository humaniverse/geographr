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
  # addPolygons(
  #   data = st_collection_extract(geographr::pcn, "POLYGON"),
  #   fillColor = "#bb7ed7",
  #   weight = 0.7,
  #   opacity = 0.8,
  #   color = "black",
  #   dashArray = "2",
  #   fillOpacity = 0.7,
  #   options = pathOptions(pane = "pcn"),
  #   highlight = highlightOptions(
  #     weight = 5,
  #     color = "#666",
  #     dashArray = "",
  #     fillOpacity = 0.7,
  #     bringToFront = TRUE
  #   ),
  #   label = ~pcn_name,
  #   group = "pcn"
  # ) %>%
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
  # addPolygons(
  #   data = geographr::ccg,
  #   fillColor = "#bb7ed7",
  #   weight = 0.7,
  #   opacity = 0.8,
  #   color = "black",
  #   dashArray = "2",
  #   fillOpacity = 0.7,
  #   options = pathOptions(pane = "ccg"),
  #   highlight = highlightOptions(
  #     weight = 5,
  #     color = "#666",
  #     dashArray = "",
  #     fillOpacity = 0.7,
  #     bringToFront = TRUE
  #   ),
  #   label = ~ccg_name,
  #   group = "ccg"
  # ) %>%
#   addLayersControl(
#     overlayGroups = c("msoa", "ccg"),
#     options = layersControlOptions(collapsed = FALSE)
#   ) %>%
#   addControl(title, position = "topright", className="map-title")
#
# saveWidget(map, "misc/msoa_ccg_map.html")

# ---- MSOA to STP ----
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
#   tag.map.title, HTML("Exploe MSOA and STP boundary overlaps")
# )
#
# map <-
#   leaflet(
#   options = leafletOptions(minZoom = 5, maxZoom = 15, attributionControl = F)
# ) %>%
#   setView(lat = 54.00366, lng = -2.547855, zoom = 7) %>%
#   addProviderTiles(providers$CartoDB.Positron) %>%
#   addMapPane("msoa", zIndex = 410) %>%
#   addMapPane("stp", zIndex = 420) %>%
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
#     data = geographr::stp,
#     fillColor = "#bb7ed7",
#     weight = 0.7,
#     opacity = 0.8,
#     color = "black",
#     dashArray = "2",
#     fillOpacity = 0.7,
#     options = pathOptions(pane = "stp"),
#     highlight = highlightOptions(
#       weight = 5,
#       color = "#666",
#       dashArray = "",
#       fillOpacity = 0.7,
#       bringToFront = TRUE
#     ),
#     label = ~stp_name,
#     group = "stp"
#   ) %>%
#   addLayersControl(
#     overlayGroups = c("msoa", "stp"),
#     options = layersControlOptions(collapsed = FALSE)
#   ) %>%
#   addControl(title, position = "topright", className="map-title")
#
# saveWidget(map, "misc/msoa_stp_map.html")

# ---- All areas ----
library(tidyverse)
library(htmlwidgets)
library(sf)
library(leaflet)
library(htmltools)

devtools::load_all(".")

map <-
  leaflet(
  options = leafletOptions(minZoom = 5, maxZoom = 15, attributionControl = F)
) %>%
  setView(lat = 54.00366, lng = -2.547855, zoom = 7) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addMapPane("boundaries_msoa", zIndex = 410) %>%
  addMapPane("boundaries_ccg", zIndex = 430) %>%
  addMapPane("boundaries_stp", zIndex = 440) %>%
  addMapPane("boundaries_lad", zIndex = 450) %>%
  addMapPane("boundaries_wards", zIndex = 460) %>%
  addMapPane("boundaries_counties_ua", zIndex = 470) %>%
  addMapPane("boundaries_towns_cities", zIndex = 480) %>%
  addPolygons(
    data = boundaries_msoa,
    fillColor = "#73aeea",
    weight = 0.7,
    opacity = 0.8,
    color = "black",
    dashArray = "2",
    fillOpacity = 0.7,
    options = pathOptions(pane = "boundaries_msoa"),
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE
    ),
    label = ~msoa_name,
    group = "boundaries_msoa"
  ) %>%
  addPolygons(
    data = boundaries_ccg,
    fillColor = "#e3bf7a",
    weight = 0.7,
    opacity = 0.8,
    color = "black",
    dashArray = "2",
    fillOpacity = 0.7,
    options = pathOptions(pane = "boundaries_ccg"),
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE
    ),
    label = ~ccg_name,
    group = "boundaries_ccg"
  ) %>%
  addPolygons(
    data = boundaries_stp,
    fillColor = "#98c379",
    weight = 0.7,
    opacity = 0.8,
    color = "black",
    dashArray = "2",
    fillOpacity = 0.7,
    options = pathOptions(pane = "boundaries_stp"),
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE
    ),
    label = ~stp_name,
    group = "boundaries_stp"
  ) %>%
  addPolygons(
    data = boundaries_lad,
    fillColor = "#e3bf7a",
    weight = 0.7,
    opacity = 0.8,
    color = "black",
    dashArray = "2",
    fillOpacity = 0.7,
    options = pathOptions(pane = "boundaries_lad"),
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE
    ),
    label = ~lad_name,
    group = "boundaries_lad"
  ) %>%
  addPolygons(
    data = boundaries_wards,
    fillColor = "#e3bf7a",
    weight = 0.7,
    opacity = 0.8,
    color = "black",
    dashArray = "2",
    fillOpacity = 0.7,
    options = pathOptions(pane = "boundaries_wards"),
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE
    ),
    label = ~ward_name,
    group = "boundaries_wards"
  ) %>%
  addPolygons(
    data = boundaries_counties_ua,
    fillColor = "#e3bf7a",
    weight = 0.7,
    opacity = 0.8,
    color = "black",
    dashArray = "2",
    fillOpacity = 0.7,
    options = pathOptions(pane = "boundaries_counties_ua"),
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE
    ),
    label = ~county_ua_name,
    group = "boundaries_counties_ua"
  ) %>%
  addPolygons(
    data = boundaries_towns_cities,
    fillColor = "#e3bf7a",
    weight = 0.7,
    opacity = 0.8,
    color = "black",
    dashArray = "2",
    fillOpacity = 0.7,
    options = pathOptions(pane = "boundaries_towns_cities"),
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE
    ),
    label = ~town_city_name,
    group = "boundaries_towns_cities"
  ) %>%
  addLayersControl(
    overlayGroups = c(
      "boundaries_msoa",
      "boundaries_ccg",
      "boundaries_stp",
      "boundaries_lad",
      "boundaries_wards",
      "boundaries_counties_ua",
      "boundaties_towns_cities"),
    options = layersControlOptions(collapsed = FALSE)
  )

saveWidget(map, "misc/all_areas_map.html")
