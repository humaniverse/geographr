# ---- Load ----
library(tidyverse)
library(lobstr)
library(sf)

# File downloaded from https://data.spatialhub.scot/dataset/nhs_hospitals-is/resource/b810d206-45bd-4dff-bac7-110a50b4bd3b
# Needs registration and login to obtain
infile <- "data-raw/points_scotland_hospitals24.json"

# Read data
hospitals <- read_sf(infile) |>
  st_transform(crs = 4326)

# Select and rename vars
hospitals <- hospitals |>
  select(
    scotland_hospital24_code = sitecode,
    scotland_hospital24_name = sitename,
    hb19_code = hbcode,
    hb19_name = hbname,
    postcode,
    address,
    geometry
  )

# Align hb names with other geographr::boundaries_hb19
hospitals <- hospitals |>
  mutate(hb19_name = str_remove(hb19_name, "^NHS "))

# Make sure geometries are valid
hospitals <- st_make_valid(hospitals)

# Check geometry types are homogenous
if (hospitals |> st_geometry_type() |> unique() |> length() > 1) {
  stop("Incorrect geometry types")
}

if (hospitals |> st_geometry_type() |> unique() != "POINT") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(hospitals) > 50000000) {
  stop("File is too large")
}

# Rename
points_scotland_hospitals24 <- hospitals

# Save output to data/ folder
usethis::use_data(points_scotland_hospitals24, overwrite = TRUE)
