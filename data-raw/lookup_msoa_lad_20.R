# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "msoa_lad_20") |>
  pull(query)

msoa_lad <-
  read_sf(query_url)

# Select and rename vars
msoa_lad <-
  msoa_lad |>
  select(
    msoa_11_name = MSOA11NM,
    msoa_11_code = MSOA11CD,
    lad_20_name = LAD20NM,
    lad_20_code = LAD20CD
  )

# Rename
lookup_msoa_lad_20 <- msoa_lad

# Save output to data/ folder
usethis::use_data(lookup_msoa_lad_20, overwrite = TRUE)
