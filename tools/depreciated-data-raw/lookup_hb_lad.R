# ---- Load ----
library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "hb_lad") %>%
  pull(query_url)

hb_lad <-
  read_csv(query_url)

# Keep only 2019 LAD and HB codes
hb_lad <-
  hb_lad %>%
  select(
    hb_name = HBName,
    hb_code = HB,
    lad_name = CAName,
    lad_code = CA
  ) %>%
  filter(lad_code %in% boundaries_lad$lad_code) %>%
  filter(hb_code %in% boundaries_hb$hb_code) %>%
  distinct(lad_code, hb_code, .keep_all = TRUE)

# Rename
lookup_hb_lad <- hb_lad

# Save output to data/ folder
usethis::use_data(lookup_hb_lad, overwrite = TRUE)