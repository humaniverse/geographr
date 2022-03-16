# ---- Load ----
library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lsoa_11_msoa_11") |>
  pull(query)

lsoa_msoa <-
  read_csv(query_url)

# Select and rename vars
lsoa_msoa <-
  lsoa_msoa |>
  select(
    lsoa_11_name = LSOA11NM,
    lsoa_11_code = LSOA11CD,
    msoa_11_name = MSOA11NM,
    msoa_11_code = MSOA11CD
  ) |>
  distinct()

# Rename
lookup_lsoa_11_msoa_11 <- lsoa_msoa

# Save output to data/ folder
usethis::use_data(lookup_lsoa_11_msoa_11, overwrite = TRUE)
