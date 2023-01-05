# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lsoa11_ward17") |>
  pull(query)

# LSOA 2011 to Ward 2017 lookup
lookup_lsoa11_ward17 <- read_sf(query_url)

lookup_lsoa11_ward17 <-
  lookup_lsoa11_ward17 |>
  st_drop_geometry() |>
  select(lsoa11_code = LSOA11CD, ward17_code = WD17CD)

# MSOA 2011 to Ward 2017 lookup
lookup_msoa11_ward17 <-
  lookup_lsoa11_msoa11 |>
  select(lsoa11_code, msoa11_code) |>
  left_join(lookup_lsoa11_ward17) |>
  distinct(msoa11_code, ward17_code) |>
  filter(str_detect(msoa11_code, "^E|^W"))

# MSOA 2021 to Ward 2017 lookup
lookup_msoa21_ward17 <-
  lookup_msoa11_ward17 |>
  left_join(lookup_msoa11_msoa21_ltla22) |>
  distinct(msoa21_code, ward17_code)

# Save output to data/ folder
usethis::use_data(lookup_lsoa11_ward17, overwrite = TRUE)
usethis::use_data(lookup_msoa11_ward17, overwrite = TRUE)
usethis::use_data(lookup_msoa21_ward17, overwrite = TRUE)
