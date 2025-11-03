# ---- Load ----
library(tidyverse)
library(sf)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla24_region24") |>
  pull(query)

ltla_region <-
  read_sf(query_url) |>
  st_drop_geometry()

# Select and rename vars
lookup_ltla24_region24 <-
  ltla_region |>
  st_drop_geometry() |>
  select(
    ltla24_name = LAD24NM,
    ltla24_code = LAD24CD,
    region24_name = RGN24NM,
    region24_code = RGN24CD
  )

# Save output to data/ folder
usethis::use_data(lookup_ltla24_region24, overwrite = TRUE)
