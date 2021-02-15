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
  # addMapPane("boundaries_pcn", zIndex = 420) %>%
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
  # addPolygons(
  #   data = boundaries_pcn,
  #   fillColor = "#73aeea",
  #   weight = 0.7,
  #   opacity = 0.8,
  #   color = "black",
  #   dashArray = "2",
  #   fillOpacity = 0.7,
  #   options = pathOptions(pane = "boundaries_pcn"),
  #   highlight = highlightOptions(
  #     weight = 5,
  #     color = "#666",
  #     dashArray = "",
  #     fillOpacity = 0.7,
  #     bringToFront = TRUE
  #   ),
  #   label = ~pcn_name,
  #   group = "boundaries_pcn"
  # ) %>%
  # addPolygons(
  #   data = boundaries_ccg,
  #   fillColor = "#e3bf7a",
  #   weight = 0.7,
  #   opacity = 0.8,
  #   color = "black",
  #   dashArray = "2",
  #   fillOpacity = 0.7,
  #   options = pathOptions(pane = "boundaries_ccg"),
  #   highlight = highlightOptions(
  #     weight = 5,
  #     color = "#666",
  #     dashArray = "",
  #     fillOpacity = 0.7,
  #     bringToFront = TRUE
  #   ),
  #   label = ~ccg_name,
  #   group = "boundaries_ccg"
  # ) %>%
  # addPolygons(
  #   data = boundaries_stp,
  #   fillColor = "#98c379",
  #   weight = 0.7,
  #   opacity = 0.8,
  #   color = "black",
  #   dashArray = "2",
  #   fillOpacity = 0.7,
  #   options = pathOptions(pane = "boundaries_stp"),
  #   highlight = highlightOptions(
  #     weight = 5,
  #     color = "#666",
  #     dashArray = "",
  #     fillOpacity = 0.7,
  #     bringToFront = TRUE
  #   ),
  #   label = ~stp_name,
  #   group = "boundaries_stp"
  # ) %>%
  # addPolygons(
  #   data = boundaries_lad,
  #   fillColor = "#e3bf7a",
  #   weight = 0.7,
  #   opacity = 0.8,
  #   color = "black",
  #   dashArray = "2",
  #   fillOpacity = 0.7,
  #   options = pathOptions(pane = "boundaries_lad"),
  #   highlight = highlightOptions(
  #     weight = 5,
  #     color = "#666",
  #     dashArray = "",
  #     fillOpacity = 0.7,
  #     bringToFront = TRUE
  #   ),
  #   label = ~lad_name,
  #   group = "boundaries_lad"
  # ) %>%
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
  # addPolygons(
  #   data = boundaries_counties_ua,
  #   fillColor = "#e3bf7a",
  #   weight = 0.7,
  #   opacity = 0.8,
  #   color = "black",
  #   dashArray = "2",
  #   fillOpacity = 0.7,
  #   options = pathOptions(pane = "boundaries_counties_ua"),
  #   highlight = highlightOptions(
  #     weight = 5,
  #     color = "#666",
  #     dashArray = "",
  #     fillOpacity = 0.7,
  #     bringToFront = TRUE
  #   ),
  #   label = ~county_ua_name,
  #   group = "boundaries_counties_ua"
  # ) %>%
  # addPolygons(
  #   data = boundaries_towns_cities,
  #   fillColor = "#e3bf7a",
  #   weight = 0.7,
  #   opacity = 0.8,
  #   color = "black",
  #   dashArray = "2",
  #   fillOpacity = 0.7,
  #   options = pathOptions(pane = "boundaries_towns_cities"),
  #   highlight = highlightOptions(
  #     weight = 5,
  #     color = "#666",
  #     dashArray = "",
  #     fillOpacity = 0.7,
  #     bringToFront = TRUE
  #   ),
  #   label = ~town_city_name,
  #   group = "boundaries_towns_cities"
  # ) %>%
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
