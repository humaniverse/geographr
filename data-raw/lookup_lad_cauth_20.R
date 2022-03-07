# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lad_cauth_20") |>
  pull(query)

lad_cauth <-
  read_sf(query_url)

# Select and rename vars
lad_cauth <-
  msoa_lad |>
  select(
    lad_20_name = LAD20NM,
    lad_20_code = LAD20CD,
    cauth_20_name = CAUTH20NM,
    cauth_20_code = CAUTH20CD
  )

# Rename
lookup_lad_cauth_20 <- lad_cauth

# Save output to data/ folder
usethis::use_data(lookup_lad_cauth_20, overwrite = TRUE)
