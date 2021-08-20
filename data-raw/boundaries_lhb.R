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
  query_urls %>%
  filter(data_set == "lhb") %>%
  pull(query_url)

lhb <-
  read_sf(query_url)

lhb <-
  lhb %>%
  st_transform(crs = 4326)

# Select and rename vars
lhb <-
  lhb %>%
  select(
    lhb_name = lhb19nm,
    lhb_code = lhb19cd,
    geometry
  )

# Make sure geometries are valid
lhb <- st_make_valid(lhb)

# Simplify shape to reduce file size
lhb <- ms_simplify(lhb)

# Check geometry types are homogenous
if (lhb %>%
  st_geometry_type() %>%
  unique() %>%
  length() > 1) {
  stop("Incorrect geometry types")
}

if (lhb %>%
  st_geometry_type() %>%
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(lhb) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_lhb <- lhb

# Save output to data/ folder
usethis::use_data(boundaries_lhb, overwrite = TRUE)