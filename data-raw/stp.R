# ---- Load libraries ----
library(tidyverse)
library(sf)
library(httr)

# ---- Load shapefile ----
# Sustainability and Transformation Partnerships (April 2020) Boundaries EN BUC
# source: https://geoportal.statistics.gov.uk/datasets/sustainability-and-transformation-partnerships-april-2020-boundaries-en-buc?geometry=-41.520%2C48.021%2C37.230%2C57.304
GET(
  "https://opendata.arcgis.com/datasets/adb5b6cb582c4828bf11ac05ef9cee0c_0.zip?outSR=%7B%22latestWkid%22%3A27700%2C%22wkid%22%3A27700%7D",
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())
unlink(tf)
rm(tf)

shapefile <- paste0(
  tempdir(),
  "/Sustainability_and_Transformation_Partnerships_(April_2020)_Boundaries_EN_BUC.shp"
)

stp <-
  read_sf(shapefile) %>%
  st_transform(crs = 4326)

# Select and rename vars
stp <-
  stp %>%
  select(
    stp_name = stp20nm,
    stp_code = stp20cd,
    geometry
  )

# Make sure geometries are valid
stp <- st_make_valid(stp)

# Save output to data/ folder
usethis::use_data(stp, overwrite = TRUE)
