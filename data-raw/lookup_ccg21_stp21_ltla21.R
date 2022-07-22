# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lsoa11_ccg21_stp21_ltla21") |>
  pull(query)

raw <-
  read_sf(query_url) |>
  st_drop_geometry()

# Select and rename vars
lookup_lsoa11_ccg21_stp21_ltla21 <-
  raw |>
  select(
    lsoa11_name = LSOA11NM,
    lsoa11_code = LSOA11CD,
    ccg21_name = CCG21NM,
    ccg21_code = CCG21CD,
    stp21_name = STP21NM,
    stp21_code = STP21CD,
    ltla21_name = LAD21NM,
    ltla21_code = LAD21CD
  )

# Save output to data/ folder
usethis::use_data(lookup_lsoa11_ccg21_stp21_ltla21, overwrite = TRUE)