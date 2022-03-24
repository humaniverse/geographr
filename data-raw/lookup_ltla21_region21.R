# ---- Load ----
library(tidyverse)
library(sf)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla21_region21") |>
  pull(query)

ltla_region <-
  read_sf(query_url)

# Select and rename vars
ltla_region <-
  ltla_region %>%
  st_drop_geometry() %>%
  select(
    ltla21_name = LAD21NM,
    ltla21_code = LAD21CD,
    region21_name = RGN21NM,
    region21_code = RGN21CD
  )

# Rename
lookup_ltla21_region21 <- ltla_region

# Save output to data/ folder
usethis::use_data(lookup_ltla21_region21, overwrite = TRUE)
