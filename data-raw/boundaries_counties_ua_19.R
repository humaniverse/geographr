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
  filter(id == "counties_ua_19") |>
  pull(query)

counties_ua <-
  read_sf(query_url) |>
  st_transform(crs = 4326)

# Select and rename vars
counties_ua <-
  counties_ua |>
  select(
    county_ua_19_name = ctyua19nm,
    county_ua_19_code = ctyua19cd,
    geometry
  )

# Make sure geometries are valid
counties_ua <- st_make_valid(counties_ua)

# Check geometry types are homogenous
if (counties_ua |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (counties_ua |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(counties_ua) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_counties_ua_19 <- counties_ua

# Save output to data/ folder
usethis::use_data(boundaries_counties_ua_19, overwrite = TRUE)