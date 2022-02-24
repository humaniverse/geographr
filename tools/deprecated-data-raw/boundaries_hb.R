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
  query_urls |>
  filter(data_set == "hb") |>
  pull(query_url)

# GET and unzip shapefiles
GET(
  query_url,
  write_disk(zip_folder <- tempfile(fileext = ".zip"))
)

unzip(zip_folder, exdir = tempdir())

shp <- paste0(tempdir(), "/SG_NHS_HealthBoards_2019.shp")

hb <-
  read_sf(shp) |>
  st_transform(crs = 4326)

# Select and rename vars
hb <-
  hb |>
  select(
    hb_name = HBName,
    hb_code = HBCode,
    geometry
  )

# Make sure geometries are valid
hb <- st_make_valid(hb)

# Simplify shape to reduce file size
hb <- ms_simplify(hb)

# Check geometry types are homogenous
if (hb |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (hb |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(hb) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_hb <- hb

# Save output to data/ folder
usethis::use_data(boundaries_hb, overwrite = TRUE)