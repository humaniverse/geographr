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
  filter(id == "ruc21_lsoa21") |>
  pull(query)

ruc_lsoa <-
  read_sf(query_url) |>
  st_drop_geometry()

# Classifications
ruc21_lsoa21 <-
  ruc_lsoa |>
  select(
    lsoa21_code = LSOA21CD,
    ruc21_code = RUC21CD,
    classification = RUC21NM,
    ruc = Urban_rural_flag
  )

# Save output to data/ folder
usethis::use_data(ruc21_lsoa21, overwrite = TRUE)
