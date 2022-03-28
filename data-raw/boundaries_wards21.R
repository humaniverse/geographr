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
  filter(id == "wards21") |>
  pull(query)

wards <-
  read_sf(query_url) |>
  st_transform(crs = 4326)

# Select and rename vars
wards <-
  wards |>
  select(
    ward21_name = WD21NM,
    ward21_code = WD21CD,
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
boundaries_wards21 <- wards

# Save output to data/ folder
usethis::use_data(boundaries_wards21, overwrite = TRUE)
