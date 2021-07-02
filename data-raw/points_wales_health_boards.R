# ---- Load ----
library(tidyverse)
library(sf)
library(lobstr)
library(devtools)
library(httr)
library(tidygeocoder)

# Load package
load_all(".")

# Load raw health board data
health_boards <-
  read_csv("data-raw/wales_health_boards.csv")

# Geocode
health_boards_geocoded <-
  health_boards %>%
  geocode(
    postalcode = Postcode,
    method = "osm"
  )

# Convert to sf object
health_boards_sf <-
  health_boards_geocoded %>%
  select(hb_code = `Health Board code`, hb_alt_code = `Health board alt code`, hb_name = `Health Board`, lat, long) %>%
  st_as_sf(coords = c("long", "lat"), crs = 4326)

# Make sure geometries are valid
health_boards_sf <-
  st_make_valid(health_boards_sf)

# Check geometry types are homogenous
if (health_boards_sf %>%
    st_geometry_type() %>%
    unique() %>%
    length() > 1) {
  stop("Incorrect geometry types")
}

if (health_boards_sf %>%
    st_geometry_type() %>%
    unique() != "POINT") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(health_boards_sf) > 50000000) {
  stop("File is too large")
}

# Rename
points_wales_health_boards <- health_boards_sf

# Save output to data/ folder
usethis::use_data(points_wales_health_boards, overwrite = TRUE)
