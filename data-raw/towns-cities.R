# ---- Load libraries ----
library(tidyverse)
library(sf)
library(httr)
library(lobstr)

# ---- Load shapefile ----
# Major Towns and Cities (December 2015) Boundaries - Generalised Grid (50m) - clipped to the coastline (Mean High Water mark).
# source: https://geoportal.statistics.gov.uk/datasets/major-towns-and-cities-december-2015-boundaries
GET(
  "https://opendata.arcgis.com/datasets/5048387903bc49ca964cf04cd42b790d_0.zip?outSR=%7B%22latestWkid%22%3A27700%2C%22wkid%22%3A27700%7D",
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())
unlink(tf)
rm(tf)

shapefile <- paste0(
  tempdir(),
  "/Major_Towns_and_Cities__December_2015__Boundaries.shp"
)

towns_cities <-
  read_sf(shapefile) %>%
  st_transform(crs = 4326)

# Select and rename vars
towns_cities <-
  towns_cities %>%
  select(
    town_city_name = TCITY15NM,
    town_city_code = TCITY15CD,
    geometry
  )

# Make sure geometries are valid
towns_cities <- st_make_valid(towns_cities)

# Check object is below 50Mb GitHub warning limit
if(obj_size(towns_cities) > 50000000) {
  stop("File is too large")
}

# Save output to data/ folder
usethis::use_data(towns_cities, overwrite = TRUE)
