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
  filter(id == "pfa_20") |>
  pull(query)

pfa <-
  read_sf(query_url) |>
  st_transform(crs = 4326)

# Select and rename vars
pfa <-
  pfa |>
  select(
    pfa_20_name = PFA20NM,
    pfa_20_code = PFA20CD,
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
boundaries_pfa_20 <- pfa

# Save output to data/ folder
usethis::use_data(boundaries_pfa_20, overwrite = TRUE)