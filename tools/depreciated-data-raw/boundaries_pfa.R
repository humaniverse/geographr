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
  filter(data_set == "pfa") |>
  pull(query_url)

pfa <-
  read_sf(query_url) |>
  st_transform(crs = 4326)

# Select and rename vars
pfa <-
  pfa |>
  select(
    pfa_name = PFA20NM,
    pfa_code = PFA20CD,
    geometry
  )

# Make sure geometries are valid
pfa <- st_make_valid(pfa)

# Check geometry types are homogenous
if (pfa |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (pfa |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(pfa) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_pfa <- pfa

# Save output to data/ folder
usethis::use_data(boundaries_pfa, overwrite = TRUE)