# ---- Load ----
library(tidyverse)
library(sf)
library(lobstr)
library(devtools)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lrp19") |>
  pull(query)

# GET and unzip shapefiles
GET(
  query_url,
  write_disk(
    zip_folder <- tempfile(fileext = ".zip")
  )
)

unzip(zip_folder, exdir = tempdir())

shp <- file.path(tempdir(), "SG_LocalResiliencePartnerships_2019.shp")

lrp <-
  read_sf(shp) |>
  st_transform(crs = 4326)

# Select and rename vars
lrp <-
  lrp |>
  select(
    lrp19_name = LRPCode,
    lrp19_code = LRPName,
    geometry
  )

# Make sure geometries are valid
lrp <- st_make_valid(lrp)

# Check geometry types are homogenous
if (lrp |>
    st_geometry_type() |>
    unique() |>
    length() > 1) {
  stop("Incorrect geometry types")
}

if (lrp |>
    st_geometry_type() |>
    unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(lrp) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_lrp19 <- lrp

# Save output to data/ folder
usethis::use_data(boundaries_lrp19, overwrite = TRUE)
