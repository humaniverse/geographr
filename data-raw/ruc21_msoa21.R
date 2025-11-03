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
  filter(id == "ruc21_msoa21") |>
  pull(query)

ruc_msoa <-
  read_sf(query_url) |>
  st_drop_geometry()

# Classifications
ruc21_msoa21 <-
  ruc_msoa |>
  select(
    msoa21_code = MSOA21CD,
    ruc21_code = RUC21CD,
    classification = RUC21NM,
    ruc = Urban_rural_flag
  )

# Save output to data/ folder
usethis::use_data(ruc21_msoa21, overwrite = TRUE)
