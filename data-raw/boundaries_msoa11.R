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
  filter(id == "msoa11") |>
  pull(query)

msoa <-
  read_sf(query_url)

msoa <-
  msoa |>
  st_transform(crs = 4326)

# Select and rename vars
msoa <-
  msoa |>
  select(
    msoa11_name = MSOA11NM,
    msoa11_code = MSOA11CD,
    geometry
  )

# Make sure geometries are valid
msoa <- st_make_valid(msoa)

# Simplify shape to reduce file size
# Set 'keep' argument to given level so keeps all MSOA rows
msoa <- ms_simplify(msoa,  keep = 0.52)

# Check geometry types are homogenous
if (msoa |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (msoa |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check simplified shape is below 50Mb GitHub warning limit
if (obj_size(msoa) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_msoa11 <- msoa

# Save output to data/ folder
usethis::use_data(boundaries_msoa11, overwrite = TRUE)
