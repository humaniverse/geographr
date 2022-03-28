# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "msoa11_ltla19") |>
  pull(query)

msoa_ltla <-
  read_sf(query_url)

# Select and rename vars
msoa_ltla <-
  msoa_ltla |>
  select(
    msoa11_name = MSOA11NM,
    msoa11_code = MSOA11CD,
    ltla19_name = LAD19NM,
    ltla19_code = LAD19CD
  )

# Rename
lookup_msoa11_ltla19 <- msoa_ltla

# Save output to data/ folder
usethis::use_data(lookup_msoa11_ltla19, overwrite = TRUE)
