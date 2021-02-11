# ---- Load libraries ----
library(tidyverse)
library(sf)
library(httr)
library(lobstr)

# ---- Load shapefile ----
# Counties and Unitary Authorities (December 2019) Boundaries UK BUC - Ultra Generalised (500m) - clipped to the coastline (Mean High Water mark).
# source: https://geoportal.statistics.gov.uk/datasets/counties-and-unitary-authorities-december-2019-boundaries-uk-buc?geometry=-39.482%2C47.293%2C38.609%2C56.716
GET(
  "https://opendata.arcgis.com/datasets/b216b4c8a4e74f6fb692a1785255d777_0.zip?outSR=%7B%22latestWkid%22%3A27700%2C%22wkid%22%3A27700%7D",
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())
unlink(tf)
rm(tf)

shapefile <- paste0(
  tempdir(),
  "/Counties_and_Unitary_Authorities_(December_2019)_Boundaries_UK_BUC.shp"
)

counties_ua <-
  read_sf(shapefile) %>%
  st_transform(crs = 4326)

# Select and rename vars
counties_ua <-
  counties_ua %>%
  select(
    county_ua_name = ctyua19nm,
    county_ua_code = ctyua19cd,
    geometry
  )

# Make sure geometries are valid
counties_ua <- st_make_valid(counties_ua)

# Check object is below 50Mb GitHub warning limit
if(obj_size(counties_ua) > 50000000) {
  stop("File is too large")
}

# Save output to data/ folder
usethis::use_data(counties_ua, overwrite = TRUE)
