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
  filter(id == "region21") |>
  pull(query)

regions <-
  read_sf(query_url) |>
  st_transform(crs = 4326)

# Select and rename vars
regions <-
  regions |>
  select(
    region21_name = RGN21NM,
    region21_code = RGN21CD,
    geometry
  )

# Make sure geometries are valid
regions <- st_make_valid(regions)

# Check geometry types are homogenous
if (regions |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (regions |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(regions) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_region21 <- regions

# Save output to data/ folder
usethis::use_data(boundaries_region21, overwrite = TRUE)
