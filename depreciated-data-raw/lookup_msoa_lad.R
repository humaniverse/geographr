# ---- Load ----
library(tidyverse)
library(sf)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "msoa_lad") %>%
  pull(query_url)

msoa_lad <-
  read_sf(query_url)

# Select and rename vars
msoa_lad <-
  msoa_lad %>%
  select(
    msoa_name = MSOA11NM,
    msoa_code = MSOA11CD,
    lad_name = LAD19NM,
    lad_code = LAD19CD
  )

# Rename
lookup_msoa_lad <- msoa_lad

# Save output to data/ folder
usethis::use_data(lookup_msoa_lad, overwrite = TRUE)
