# ---- Load libraries ----
library(tidyverse)
library(sf)
library(httr)
library(lobstr)

# ---- Load shapefile ----
# Local Authority Districts (December 2019) Boundaries UK BUC
# source: https://geoportal.statistics.gov.uk/datasets/local-authority-districts-december-2019-boundaries-uk-buc
GET(
  "https://opendata.arcgis.com/datasets/3a4fa2ce68f642e399b4de07643eeed3_0.zip?outSR=%7B%22latestWkid%22%3A27700%2C%22wkid%22%3A27700%7D",
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())
unlink(tf)
rm(tf)

shapefile <- paste0(
  tempdir(),
  "/Local_Authority_Districts_(December_2019)_Boundaries_UK_BUC.shp"
)

la <-
  read_sf(shapefile) %>%
  st_transform(crs = 4326)

# Select and rename vars
la <-
  la %>%
  select(
    la_name = lad19nm,
    la_code = lad19cd,
    geometry
  )

# Make sure geometries are valid
la <- st_make_valid(la)

# Check object is below 50Mb GitHub warning limit
if(obj_size(lad) > 50000000) {
  stop("File is too large")
}

# Save output to data/ folder
usethis::use_data(la, overwrite = TRUE)
