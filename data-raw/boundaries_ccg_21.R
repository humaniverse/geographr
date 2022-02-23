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
  filter(id == "ccg_21") |>
  pull(query)

ccg <-
  read_sf(query_url) |>
  st_transform(crs = 4326)

# Select and rename vars
ccg <-
  ccg |>
  select(
    ccg_21_name = CCG21NM,
    ccg_21_code = CCG21CD,
    geometry
  )

# Make sure geometries are valid
ccg <- st_make_valid(ccg)

# Check geometry types are homogenous
if (ccg |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (ccg |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(ccg) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_ccg_21 <- ccg

# Save output to data/ folder
usethis::use_data(boundaries_ccg_21, overwrite = TRUE)
