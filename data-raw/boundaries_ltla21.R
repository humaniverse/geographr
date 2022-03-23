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
  filter(id == "ltla21") |>
  pull(query)

lad <-
  read_sf(query_url) |>
  st_transform(crs = 4326)

# Select and rename vars
lad <-
  lad |>
  select(
    ltla21_name = LAD21NM,
    ltla21_code = LAD21CD,
    geometry
  )

# Make sure geometries are valid
lad <- st_make_valid(lad)

# Check geometry types are homogenous
if (lad |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (lad |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(lad) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_ltla21 <- lad

# Save output to data/ folder
usethis::use_data(boundaries_ltla21, overwrite = TRUE)
