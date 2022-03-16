# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")


# Set query url
query_url <-
  query_urls |>
  filter(id == "lad_20_counties_ua_20") |>
  pull(query)

lad_counties <-
  read_sf(query_url)

lad_counties <-
  lad_counties |>
  select(
    lad_20_name = LTLA20NM,
    lad_20_code = LTLA20CD,
    county_ua_20_name = UTLA20NM,
    county_ua_20_code = UTLA20CD
  )

# Rename
lookup_lad_20_counties_ua_20 <- lad_counties

# Save output to data/ folder
usethis::use_data(lookup_lad_20_counties_ua_20, overwrite = TRUE)
