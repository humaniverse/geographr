# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")


# Set query url
query_url <-
  query_urls |>
  filter(id == "lad_21_counties_ua_21") |>
  pull(query)

lad_counties <-
  read_sf(query_url)

lad_counties <-
  lad_counties |>
  select(
    lad_21_name = LTLA21NM,
    lad_21_code = LTLA21CD,
    county_ua_21_name = UTLA21NM,
    county_ua_21_code = UTLA21CD
  )

# Rename
lookup_lad_21_counties_ua_21 <- lad_counties

# Save output to data/ folder
usethis::use_data(lookup_lad_21_counties_ua_21, overwrite = TRUE)
