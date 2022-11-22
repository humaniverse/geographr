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
  query_urls |>
  filter(id == "icb22") |>
  pull(query)

icb_raw <- read_sf(query_url) |>
  st_transform(crs = 4326)

# Select and rename vars
icb <-
  icb_raw |>
  select(
    icb22_name = LOC22NM,
    icb22_code = LOC22CD,
    geometry
  )

# Make sure geometries are valid
icb <- st_make_valid(icb)

# Simplify shape to reduce file size
icb <- ms_simplify(icb, keep = .15)

# Check geometry types are homogenous
if (icb |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (icb |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(icb) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_icb22 <- icb

# Save output to data/ folder
usethis::use_data(boundaries_icb22, overwrite = TRUE)
