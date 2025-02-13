# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lsoa21_ward24_ltla24") |>
  pull(query)

lsoa_ward_ltla <- read_sf(query_url)

# Select and rename vars
lookup_lsoa21_ward24_ltla24 <-
  lsoa_ward_ltla |>
  st_drop_geometry() |>
  select(
    lsoa21_name = LSOA21NM,
    lsoa21_code = LSOA21CD,
    ward24_name = WD24NM,
    ward24_code = WD24CD,
    ltla24_name = LAD24NM,
    ltla24_code = LAD24CD
  )

# Save output to data/ folder
usethis::use_data(lookup_lsoa21_ward24_ltla24, overwrite = TRUE)
