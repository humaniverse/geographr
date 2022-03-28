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
  filter(id == "utla19") |>
  pull(query)

utla <-
  read_sf(query_url) |>
  st_transform(crs = 4326)

# Select and rename vars
utla <-
  utla |>
  select(
    utla19_name = ctyua19nm,
    utla19_code = ctyua19cd,
    geometry
  )

# Make sure geometries are valid
utla <- st_make_valid(utla)

# Check geometry types are homogenous
if (utla |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (utla |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(utla) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_utla19 <- utla

# Save output to data/ folder
usethis::use_data(boundaries_utla19, overwrite = TRUE)
