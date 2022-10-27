# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# ---- Load lookup from ONS GeoPortal ----
# Set query url
query_url <-
  query_urls |>
  filter(id == "ccg21_stp21") |>
  pull(query)

ccg21_stp21 <- read_sf(query_url) |>
  st_drop_geometry()

lookup_ccg21_stp21 <-
  ccg21_stp21 |>
  select(
    ccg21_code = CCG21CD,
    ccg21_nhs_code = CCG21CDH,
    ccg21_name = CCG21NM,
    stp21_code = STP21CD,
    stp21_nhs_code = STP21CDH,
    stp21_name = STP21NM
  )

# Save output to data/ folder
usethis::use_data(lookup_ccg21_stp21, overwrite = TRUE)
