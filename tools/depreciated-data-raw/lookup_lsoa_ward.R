# ---- Load ----
library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "lsoa_ward") %>%
  pull(query_url)

lsoa_ward <-
  read_csv(query_url)

# Select and rename vars
lsoa_ward <-
  lsoa_ward %>%
  select(
    lsoa_name = LSOA11NM,
    lsoa_code = LSOA11CD,
    ward_name = WD19NM,
    ward_code = WD19CD
  ) %>%
  distinct()

# Rename
lookup_lsoa_ward <- lsoa_ward

# Save output to data/ folder
usethis::use_data(lookup_lsoa_ward, overwrite = TRUE)
