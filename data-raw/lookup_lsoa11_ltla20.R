# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lsoa11_ltla20") |>
  pull(query)

lsoa_ltla <- read_sf(query_url)

# Select and rename vars
lsoa_ltla <-
  lsoa_ltla |>
  select(
    lsoa11_name = LSOA11NM,
    lsoa11_code = LSOA11CD,
    ltla20_name = LAD20NM,
    ltla20_code = LAD20CD
  )

# Rename
lookup_lsoa11_ltla20 <- lsoa_ltla

# Save output to data/ folder
usethis::use_data(lookup_lsoa11_ltla20, overwrite = TRUE)
