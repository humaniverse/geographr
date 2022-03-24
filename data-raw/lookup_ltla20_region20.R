# ---- Load ----
library(tidyverse)
library(sf)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla20_region20") |>
  pull(query)

ltla_region <-
  read_sf(query_url)

# Select and rename vars
ltla_region <-
  ltla_region %>%
  st_drop_geometry() %>%
  select(
    ltla20_name = LAD20NM,
    ltla20_code = LAD20CD,
    region20_name = RGN20NM,
    region20_code = RGN20CD
  )

# Rename
lookup_ltla20_region20 <- ltla_region

# Save output to data/ folder
usethis::use_data(lookup_ltla20_region20, overwrite = TRUE)
