# ---- Load ----
library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lsoa11_msoa11") |>
  pull(query)

lsoa_msoa <-
  read_csv(query_url)

# Select and rename vars
lsoa_msoa <-
  lsoa_msoa |>
  select(
    lsoa11_name = LSOA11NM,
    lsoa11_code = LSOA11CD,
    msoa11_name = MSOA11NM,
    msoa11_code = MSOA11CD
  ) |>
  distinct()

# Rename
lookup_lsoa11_msoa11 <- lsoa_msoa

# Save output to data/ folder
usethis::use_data(lookup_lsoa11_msoa11, overwrite = TRUE)
