# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lsoa11_lsoa21_ltla22") |>
  pull(query)

raw <-
  read_sf(query_url) |>
  st_drop_geometry()

# Select and rename vars
lsoa_lsoa_ltla <-
  lsoa_lsoa_ltla |>
  select(
    lsoa11_name = LSOA11NM,
    lsoa11_code = LSOA11CD,
    lsoa21_name = LSOA21NM,
    lsoa21_code = LSOA21CD,
    ltla22_name = LAD22NM,
    ltla22_code = LAD22CD
  ) |>
  distinct()

# Rename
lookup_lsoa11_lsoa21_ltla22 <- lsoa_lsoa_ltla

# Save output to data/ folder
usethis::use_data(lookup_lsoa11_lsoa21_ltla22, overwrite = TRUE)
