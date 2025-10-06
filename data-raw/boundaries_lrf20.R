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
  filter(id == "lrf20") |>
  pull(query)

lrf <-
  read_sf(query_url) |>
  st_transform(crs = 4326)

# Select and rename vars
lrf <-
  lrf |>
  select(
    lrf20_name = LRF20NM,
    lrf20_code = LRF20CD,
    geometry
  )

# Make sure geometries are valid
lrf <- st_make_valid(lrf)

# Check geometry types are homogenous
if (lrf |>
    st_geometry_type() |>
    unique() |>
    length() > 1) {
  stop("Incorrect geometry types")
}

if (lrf |>
    st_geometry_type() |>
    unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(lrf) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_lrf20 <- lrf

# Save output to data/ folder
usethis::use_data(boundaries_lrf20, overwrite = TRUE)
