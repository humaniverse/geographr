# ---- Load ----
library(tidyverse)
library(sf)
library(lobstr)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls %>%
  filter(id == "countries_20") %>%
  pull(query)

countries <-
  read_sf(query_url) %>%
  st_transform(crs = 4326)

# Select and rename vars
countries <-
  countries %>%
  select(
    country_20_name = CTRY20NM,
    country_20_code = CTRY20CD,
    geometry
  )

# Make sure geometries are valid
countries <- st_make_valid(countries)

# Check geometry types are homogenous
if (countries %>%
  st_geometry_type() %>%
  unique() %>%
  length() > 1) {
  stop("Incorrect geometry types")
}

if (countries %>%
  st_geometry_type() %>%
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(countries) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_countries_20 <- countries

# Save output to data/ folder
usethis::use_data(boundaries_countries_20, overwrite = TRUE)