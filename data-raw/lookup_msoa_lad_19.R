# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "msoa_lad_19") |>
  pull(query)

msoa_lad <-
  read_sf(query_url)

# Select and rename vars
msoa_lad <-
  msoa_lad |>
  select(
    msoa_11_name = MSOA11NM,
    msoa_11_code = MSOA11CD,
    lad_19_name = LAD19NM,
    lad_19_code = LAD19CD
  )

# Rename
lookup_msoa_lad_19 <- msoa_lad

# Save output to data/ folder
usethis::use_data(lookup_msoa_lad_19, overwrite = TRUE)
