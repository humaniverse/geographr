# ---- Load libraries ----
library(tidyverse)
library(sf)
library(httr)
library(lobstr)

# ---- Load shapefile ----
# Clinical Commissioning Groups (April 2020) Ultra Generalised Boundaries EN
# source: https://geoportal.statistics.gov.uk/datasets/clinical-commissioning-groups-april-2020-ultra-generalised-boundaries-en?geometry=-41.190%2C48.021%2C36.901%2C57.304
GET(
  "https://opendata.arcgis.com/datasets/dbfaf69873794690af4acddaf581572f_1.zip?outSR=%7B%22latestWkid%22%3A27700%2C%22wkid%22%3A27700%7D",
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())
unlink(tf)
rm(tf)

shapefile <- paste0(
  tempdir(),
  "/Clinical_Commissioning_Groups_(April_2020)_EN_BUC.shp"
)

ccg <-
  read_sf(shapefile) %>%
  st_transform(crs = 4326)

# Select and rename vars
ccg <-
  ccg %>%
  select(
    ccg_name = ccg20nm,
    ccg_code = ccg20cd,
    geometry
  )

# Make sure geometries are valid
ccg <- st_make_valid(ccg)

# Check object is below 50Mb GitHub warning limit
if(obj_size(ccg) > 50000000) {
  stop("File is too large")
}

# Save output to data/ folder
usethis::use_data(ccg, overwrite = TRUE)
