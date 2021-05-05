# ---- Load ----
library(tidyverse)
library(httr)
library(sf)
library(rmapshaper)
library(lobstr)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "iz") %>%
  pull(query_url)

# GET and unzip shapefiles
GET(
  query_url,
  write_disk(zip_folder <- tempfile(fileext = ".zip"))
)

unzip(zip_folder, exdir = tempdir())

shp <- file.path(tempdir(), "SG_IntermediateZone_Bdry_2011.shp")

iz <-
  read_sf(shp) %>%
  st_transform(crs = 4326)

# Select and rename vars
iz <-
  iz %>%
  select(
    iz_name = Name,
    iz_code = InterZone,
    geometry
  )

# Make sure geometries are valid
iz <- st_make_valid(iz)

# Simplify shape to reduce file size
iz <- ms_simplify(iz)

# Check geometry types are homogenous
if (iz %>%
    st_geometry_type() %>%
    unique() %>%
    length() > 1) {
  stop("Incorrect geometry types")
}

if (iz %>%
    st_geometry_type() %>%
    unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(iz) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_iz <- iz

# Save output to data/ folder
usethis::use_data(boundaries_iz, overwrite = TRUE)
