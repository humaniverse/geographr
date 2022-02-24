# ---- Load ----
library(tidyverse)
library(sf)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "lad_region") |>
  pull(query_url)

lad_region <-
  read_sf(query_url)

# Select and rename vars
lad_region <-
  lad_region |>
  st_drop_geometry() |>
  select(
    lad_name = LAD19NM,
    lad_code = LAD19CD,
    region_name = RGN19NM,
    region_code = RGN19CD
  )

# Rename
lookup_lad_region <- lad_region

# Save output to data/ folder
usethis::use_data(lookup_lad_region, overwrite = TRUE)
