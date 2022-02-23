# ---- Load ----
library(tidyverse)
library(sf)
library(lobstr)
library(devtools)
library(httr)
library(tidygeocoder)
library(readxl)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "nhs_trusts_22") |>
  pull(query)

# Load raw trust data
GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".zip"))
)
unzip(tf, exdir = tempdir())


trusts_raw <- read_csv(
  file = list.files(
    tempdir(),
    pattern = "*.csv",
    full.names = TRUE
  ),
  col_names = c(
    "nhs_trust_code",
    "nhs_trust_name",
    "national_grouping",
    "high_level_health_geography",
    "address_1",
    "address_2",
    "address_3",
    "address_4",
    "address_5",
    "postcode",
    "open_date",
    "close_date"
  )
)

# Create open status
trusts_clean <-
  trusts_raw |>
  mutate(status = if_else(is.na(close_date), "open", "closed")) |>
  select(
    -open_date,
    -close_date
  )

# Drop cols
trusts_clean <-
  trusts_clean |>
  select(
    nhs_trust_22_code = nhs_trust_code,
    nhs_trust_22_name = nhs_trust_name,
    status,
    postcode
  )

# Geocode
trusts_geocoded <-
  trusts_clean |>
  geocode(
    postalcode = postcode,
    method = "osm"
  )

# Drop postcode column
trusts_geocoded <-
  trusts_geocoded |>
  select(-postcode)

# Reorder cols
trusts_geocoded <-
  trusts_geocoded |>
  relocate(nhs_trust_22_name)

# Convert to sf object
trusts_sf <-
  trusts_geocoded |>
  st_as_sf(coords = c("long", "lat"), crs = 4326)

# Make sure geometries are valid
trusts_sf <- st_make_valid(trusts_sf)

# Check geometry types are homogenous
if (trusts_sf |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (trusts_sf |>
  st_geometry_type() |>
  unique() != "POINT") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(trusts_sf) > 50000000) {
  stop("File is too large")
}

# Rename
points_nhs_trusts_22 <- trusts_sf

# Save output to data/ folder
usethis::use_data(points_nhs_trusts_22, overwrite = TRUE)