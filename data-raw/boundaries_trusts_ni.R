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
  filter(data_set == "trusts_ni") %>%
  pull(query_url)

# GET and unzip shapefiles
GET(
  query_url,
  write_disk(zip_folder <- tempfile(fileext = ".zip"))
)

unzip(zip_folder, exdir = tempdir())

shp <- paste0(tempdir(), "/2017trustBoundary/dohTrustBoundary.shp")

trusts_ni <-
  read_sf(shp) %>%
  st_transform(crs = 4326)

# Select and rename vars
trusts_ni <-
  trusts_ni %>%
  select(
    trust_name = TrustName,
    trust_code = TrustCode,
    geometry
  )

# Make sure geometries are valid
trusts_ni <- st_make_valid(trusts_ni)

# Simplify shape to reduce file size
trusts_ni <- ms_simplify(trusts_ni)

# Check geometry types are homogenous
if (trusts_ni %>%
  st_geometry_type() %>%
  unique() %>%
  length() > 1) {
  stop("Incorrect geometry types")
}

if (trusts_ni %>%
  st_geometry_type() %>%
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(trusts_ni) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_trusts_ni <- trusts_ni

# Save output to data/ folder
usethis::use_data(boundaries_trusts_ni, overwrite = TRUE)