# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "msoa11_ltla20") |>
  pull(query)

msoa_lad <-
  read_sf(query_url)

# Select and rename vars
msoa_lad <-
  msoa_lad |>
  select(
    msoa11_name = MSOA11NM,
    msoa11_code = MSOA11CD,
    ltla20_name = LAD20NM,
    ltla20_code = LAD20CD
  )

# Rename
lookup_msoa11_ltla20 <- msoa_lad

# Save output to data/ folder
usethis::use_data(lookup_msoa11_ltla20, overwrite = TRUE)
