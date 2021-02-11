# ---- Load libraries ----
library(tidyverse)
library(sf)
library(httr)

# ---- Load shapefile ----
# Wards UK (December 2020) Boundaries EN BUC - Super generalised (200m) - clipped to the coastline (Mean High Water mark).
# source: https://geoportal.statistics.gov.uk/datasets/wards-december-2020-uk-bsc-v2
GET(
  "https://opendata.arcgis.com/datasets/47eed330d67c40ecb1ac3fa38a59aac6_0.zip?outSR=%7B%22latestWkid%22%3A27700%2C%22wkid%22%3A27700%7D",
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())
unlink(tf)
rm(tf)

shapefile <- paste0(
  tempdir(),
  "/Wards__December_2020__UK_BSC_V2.shp"
)

wards <-
  read_sf(shapefile) %>%
  st_transform(crs = 4326)

# Select and rename vars
wards <-
  wards %>%
  select(
    ward_name = WD20NM,
    ward_code = WD20CD,
    geometry
  )

# Make sure geometries are valid
wards <- st_make_valid(wards)

# Save output to data/ folder
usethis::use_data(wards, overwrite = TRUE)
