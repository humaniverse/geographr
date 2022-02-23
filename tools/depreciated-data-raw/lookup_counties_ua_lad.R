# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "counties_ua_lad") |>
  pull(query_url)

counties_ua_lad <-
  read_sf(query_url)

counties_ua_lad <-
  counties_ua_lad |>
  select(
    lad_name = LTLA19NM,
    lad_code = LTLA19CD,
    county_ua_name = UTLA19NM,
    county_ua_code = UTLA19CD
  )

# Rename
lookup_counties_ua_lad <- counties_ua_lad

# Save output to data/ folder
usethis::use_data(lookup_counties_ua_lad, overwrite = TRUE)