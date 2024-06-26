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
  filter(id == "trusts_ni18") |>
  pull(query)

# GET and unzip shapefiles
GET(
  query_url,
  write_disk(
    zip_folder <- tempfile(fileext = ".zip")
  )
)

unzip(zip_folder, exdir = tempdir())

shp <- paste0(tempdir(), "/2017trustBoundary/dohTrustBoundary.shp")

trusts_ni <-
  read_sf(shp) |>
  st_transform(crs = 4326)

# Select and rename vars
trusts_ni <-
  trusts_ni |>
  select(
    trust18_name = TrustName,
    trust18_code = TrustCode,
    geometry
  )

# Rename Trusts
trusts_ni <-
  trusts_ni |>
  mutate(
    trust18_name = case_when(
      trust18_name == "Belfast Health and Social Care Trust" ~ "Belfast",
      trust18_name == "Northern Health and Social Care Trust" ~ "Northern",
      trust18_name == "Western Health and Social Care Trust" ~ "Western",
      trust18_name == "Southern Health and Social Care Trust" ~ "Southern",
      trust18_name == "South Eastern Health and Social Care Trust" ~ "South Eastern"
    )
  )

# Make sure geometries are valid
trusts_ni <- st_make_valid(trusts_ni)

# Simplify shape to reduce file size
trusts_ni <- ms_simplify(trusts_ni)

# Check geometry types are homogenous
if (trusts_ni |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (trusts_ni |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(trusts_ni) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_trusts_ni18 <- trusts_ni

# Save output to data/ folder
usethis::use_data(boundaries_trusts_ni18, overwrite = TRUE)
