# ---- Load ----
library(tidyverse)
library(sf)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "ccg_stp") |>
  pull(query_url)

ccg_stp <-
  read_sf(query_url)

# Select and rename vars
ccg_stp <-
  ccg_stp |>
  select(
    ccg_name = CCG20NM,
    ccg_code = CCG20CD,
    ccg_nhs_code = CCG20CDH,
    stp_name = STP20NM,
    stp_code = STP20CD
  )

# Rename
lookup_ccg_stp <- ccg_stp

# Save output to data/ folder
usethis::use_data(lookup_ccg_stp, overwrite = TRUE)
