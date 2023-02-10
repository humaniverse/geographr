# ---- Load ----
library(tidyverse)
library(sf)
library(lobstr)
library(devtools)

# Load package
devtools::load_all(".")

# Set query url
query_url <-
  query_urls |>
  dplyr::filter(id == "wards22") |>
  dplyr::pull(query)

wards <-
  sf::read_sf(query_url) |>
  sf::st_transform(crs = 4326)

# Select and rename vars
wards <-
  wards |>
  dplyr::select(
    ward22_name = WD22NM,
    ward22_code = WD22CD,
    geometry
  )

# Make sure geometries are valid
wards <- sf::st_make_valid(wards)

# Check geometry types are homogenous
if (wards |>
  sf::st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (wards |>
  sf::st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (lobstr::obj_size(wards) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_wards22 <- wards

# Save output to data/ folder
usethis::use_data(boundaries_wards22, overwrite = TRUE)
