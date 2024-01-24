# ---- Load ----
library(tidyverse)
library(sf)
library(lobstr)
library(rmapshaper)
library(devtools)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "sdz21") |>
  pull(query)

# Unzip and then read
# GET and unzip shapefiles
GET(
  query_url,
  write_disk(
    zip_folder <- tempfile(fileext = ".zip")
  )
)

unzip(zip_folder, exdir = tempdir())

shp <- file.path(tempdir(), "SDZ2021.shp")

sdz <-
  read_sf(shp) |>
  st_transform(crs = 4326)

# Select and rename vars
sdz <-
  sdz |>
  select(
    sdz21_name = SDZ2021_nm,
    sdz21_code = SDZ2021_cd,
    geometry
  )

# Make sure geometries are valid
sdz <- st_make_valid(sdz)

# Simplify shape to reduce file size
sdz <- ms_simplify(sdz)

# Check geometry types are homogenous
if (sdz |>
    st_geometry_type() |>
    unique() |>
    length() > 1) {
  stop("Incorrect geometry types")
}

if (sdz |>
    st_geometry_type() |>
    unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(sdz) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_sdz21 <- sdz

# Save output to data/ folder
usethis::use_data(boundaries_sdz21, overwrite = TRUE)
