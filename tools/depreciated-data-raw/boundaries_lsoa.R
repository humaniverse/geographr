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
  query_urls %>%
  filter(data_set == "lsoa") %>%
  pull(query_url)

lsoa <-
  read_sf(query_url)

lsoa <-
  lsoa %>%
  st_transform(crs = 4326)

# Select and rename vars
lsoa <-
  lsoa %>%
  select(
    lsoa_name = LSOA11NM,
    lsoa_code = LSOA11CD,
    geometry
  )

# Make sure geometries are valid
lsoa <- st_make_valid(lsoa)

# Simplify shape to reduce file size
lsoa <- ms_simplify(lsoa)

# Check geometry types are homogenous
if (lsoa %>%
    st_geometry_type() %>%
    unique() %>%
    length() > 1) {
  stop("Incorrect geometry types")
}

if (lsoa %>%
    st_geometry_type() %>%
    unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check simplified shape is below 50Mb GitHub warning limit
if (obj_size(lsoa) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_lsoa <- lsoa

# Save output to data/ folder
usethis::use_data(boundaries_lsoa, overwrite = TRUE)
