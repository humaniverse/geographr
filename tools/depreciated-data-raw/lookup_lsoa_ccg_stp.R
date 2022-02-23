# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "lsoa_ccg_stp") %>%
  pull(query_url)

lsoa_ccg_stp <-
  read_sf(query_url)

# Select and rename vars
lsoa_ccg_stp <-
  lsoa_ccg_stp %>%
  st_drop_geometry() %>%
  select(
    lsoa_name = LSOA11NM,
    lsoa_code = LSOA11CD,
    ccg_name = CCG21NM,
    ccg_code = CCG21CD,
    ccg_nhs_code = CCG21CDH,
    stp_name = STP21NM,
    stp_code = STP21CD
  ) %>%
  distinct()

# Rename
lookup_lsoa_ccg_stp <- lsoa_ccg_stp

# Save output to data/ folder
usethis::use_data(lookup_lsoa_ccg_stp, overwrite = TRUE)
