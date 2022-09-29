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
  filter(id == "vcsep22") |>
  pull(query)

vcsep_regions <-
  read_sf(query_url) |>
  st_transform(crs = 4326)

# Make sure geometries are valid
vcsep_regions <- st_make_valid(vcsep_regions)

# Check geometry types are homogenous
if (vcsep_regions |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (vcsep_regions |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(vcsep_regions) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_vcsep22 <- vcsep_regions

# Save output to data/ folder
usethis::use_data(boundaries_vcsep22, overwrite = TRUE)
