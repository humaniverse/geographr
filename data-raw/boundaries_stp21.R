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
  filter(id == "stp21") |>
  pull(query)

stp <-
  read_sf(query_url) |>
  st_transform(crs = 4326)

# Select and rename vars
stp <-
  stp |>
  select(
    stp21_name = STP21NM,
    stp21_code = STP21CD,
    geometry
  )

# Make sure geometries are valid
stp <- st_make_valid(stp)

# Check geometry types are homogenous
if (stp |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}
if (stp |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(stp) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_stp21 <- stp

# Save output to data/ folder
usethis::use_data(boundaries_stp21, overwrite = TRUE)
