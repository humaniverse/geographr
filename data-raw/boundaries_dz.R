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
  filter(data_set == "dz") %>%
  pull(query_url)

# GET and unzip shapefiles
GET(
  query_url,
  write_disk(zip_folder <- tempfile(fileext = ".zip"))
)

unzip(zip_folder, exdir = tempdir())

shp <- file.path(tempdir(), "SG_DataZone_Bdry_2011.shp")

dz <-
  read_sf(shp) %>%
  st_transform(crs = 4326)

# Select and rename vars
dz <-
  dz %>%
  select(
    dz_name = Name,
    dz_code = DataZone,
    geometry
  )

# Make sure geometries are valid
dz <- st_make_valid(dz)

# Simplify shape to reduce file size
dz <- ms_simplify(dz)

# Check geometry types are homogenous
if (dz %>%
    st_geometry_type() %>%
    unique() %>%
    length() > 1) {
  stop("Incorrect geometry types")
}

if (dz %>%
    st_geometry_type() %>%
    unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(dz) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_dz <- dz

# Save output to data/ folder
usethis::use_data(boundaries_dz, overwrite = TRUE)
