# ---- Load libraries ----
library(tidyverse)
library(sf)
library(httr)
library(rmapshaper)
library(lobstr)

# ---- Load shapefile ----
# Middle Layer Super Output Areas (December 2011) Boundaries Full Clipped (BFC) EW V3
# source: https://geoportal.statistics.gov.uk/datasets/middle-layer-super-output-areas-december-2011-boundaries-full-clipped-bfc-ew-v3?geometry=-41.548%2C48.013%2C37.202%2C57.298
GET(
  "https://opendata.arcgis.com/datasets/1382f390c22f4bed89ce11f2a9207ff0_0.zip?outSR=%7B%22latestWkid%22%3A27700%2C%22wkid%22%3A27700%7D",
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())
unlink(tf)
rm(tf)

shapefile <- paste0(
  tempdir(),
  "/Middle_Layer_Super_Output_Areas__December_2011__Boundaries_Full_Clipped__BFC__EW_V3.shp"
)

msoa <-
  read_sf(shapefile) %>%
  st_transform(crs = 4326)

# Select and rename vars
msoa <-
  msoa %>%
  select(
    msoa_name = MSOA11NM,
    msoa_code = MSOA11CD,
    geometry
  )

# Make sure geometries are valid
msoa <- st_make_valid(msoa)

# Simplify shape to reduce file size
msoa <- ms_simplify(msoa)

# Check simplified shape is below 50Mb GitHub warning limit
if(obj_size(msoa) > 50000000) {
  stop("File is too large")
}

# Save output to data/ folder
usethis::use_data(msoa, overwrite = TRUE)
