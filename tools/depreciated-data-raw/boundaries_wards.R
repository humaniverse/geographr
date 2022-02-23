# ---- Load ----
library(tidyverse)
library(sf)
library(lobstr)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "wards") |>
  pull(query_url)

wards <-
  read_sf(query_url) |>
  st_transform(crs = 4326)

# Select and rename vars
wards <-
  wards |>
  select(
    ward_name = WD20NM,
    ward_code = WD20CD,
    geometry
  )

# Make sure geometries are valid
wards <- st_make_valid(wards)

# Check geometry types are homogenous
if (wards |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (wards |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(wards) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_wards <- wards

# Save output to data/ folder
usethis::use_data(boundaries_wards, overwrite = TRUE)
