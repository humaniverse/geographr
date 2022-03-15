# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lad_21_fra_21") |>
  pull(query)

lad_fra <-
  read_sf(query_url)

# Select and rename vars
lad_fra <-
  lad_fra |>
  select(
    lad_21_name = LAD21NM,
    lad_21_code = LAD21CD,
    fra_21_name = FRA21NM,
    fra_21_code = FRA21CD
  )

# Rename
lookup_lad_21_fra_21 <- lad_fra

# Save output to data/ folder
usethis::use_data(lookup_lad_21_fra_21, overwrite = TRUE)
