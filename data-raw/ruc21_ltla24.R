# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# ---- Load England and Wales ----
# Set query url
query_url <-
  query_urls |>
  filter(id == "ruc21_ltla24") |>
  pull(query)

ruc_ltla <-
  read_sf(query_url) |>
  st_drop_geometry()

# Classifications
ruc21_ltla24 <-
  ruc_ltla |>
  select(
    ltla24_code = LAD24CD,
    ruc21_code = RUC21CD,
    classification = RUC21NM,
    ruc = Urban_rural_flag
  )

# Save output to data/ folder
usethis::use_data(ruc21_ltla24, overwrite = TRUE)
