# ---- Load ----
library(tidyverse)
library(sf)
library(rmapshaper)
library(lobstr)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lsoa21") |>
  pull(query)

lsoa <-
  read_sf(query_url)

lsoa <-
  lsoa |>
  st_transform(crs = 4326)

# Select and rename vars
lsoa <-
  lsoa |>
  select(
    lsoa21_name = LSOA21NM,
    lsoa21_code = LSOA21CD,
    geometry
  )

# Make sure geometries are valid
lsoa <- st_make_valid(lsoa)

# Simplify shape to reduce file size
# Set 'keep' argument to given level so keeps all LSOA rows
# lsoa <- ms_simplify(lsoa, keep = 0.895)

# Check geometry types are homogenous
if (lsoa |>
    st_geometry_type() |>
    unique() |>
    length() > 1) {
  stop("Incorrect geometry types")
}

if (lsoa |>
    st_geometry_type() |>
    unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check simplified shape is below 50Mb GitHub warning limit
if (obj_size(lsoa) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_lsoa21 <- lsoa

# Save output to data/ folder
usethis::use_data(boundaries_lsoa21, overwrite = TRUE)
