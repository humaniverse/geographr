# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lsoa01_lsoa11") |>
  pull(query)

raw <-
  read_sf(query_url) |>
  st_drop_geometry()

# Select and rename vars
lookup_lsoa01_lsoa11 <-
  raw |>
  select(
    lsoa01_name = LSOA01NM,
    lsoa01_code = LSOA01CD,
    change_code = CHGIND,
    lsoa11_name = LSOA11NM,
    lsoa11_code = LSOA11CD
  ) |>
  distinct()

# Save output to data/ folder
usethis::use_data(lookup_lsoa01_lsoa11, overwrite = TRUE)
