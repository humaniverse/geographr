# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "msoa11_msoa21_ltla22") |>
  pull(query)

msoa_msoa_ltla <-
  read_sf(query_url)

# Select and rename vars
msoa_msoa_ltla <-
  msoa_msoa_ltla |>
  select(
    msoa11_name = MSOA11NM,
    msoa11_code = MSOA11CD,
    msoa21_name = MSOA21NM,
    msoa21_code = MSOA21CD,
    ltla22_name = LAD22NM,
    ltla22_code = LAD22CD
  ) |>
  distinct()

# Rename
lookup_msoa11_msoa21_ltla22 <- msoa_msoa_ltla

# Save output to data/ folder
usethis::use_data(lookup_msoa11_msoa21_ltla22, overwrite = TRUE)
