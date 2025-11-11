# ---- Load ----
library(tidyverse)
library(sf)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lsoa21_icb24") |>
  pull(query)

lsoa_icb <-
  read_sf(query_url) |>
  st_drop_geometry()

# Select and rename vars
lookup_lsoa21_icb24 <-
  lsoa_icb |>
  st_drop_geometry() |>
  select(
    lsoa21_name = LSOA21NM,
    lsoa21_code = LSOA21CD,
    sicbl24_name = SICBL24NM,
    sicbl24_code = SICBL24CD,
    icb24_name = ICB24CDH,
    icb24_code = ICB24CD
  )

# Save output to data/ folder
usethis::use_data(lookup_lsoa21_icb24, overwrite = TRUE)
