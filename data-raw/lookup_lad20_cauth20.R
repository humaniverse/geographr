# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla20_cauth20") |>
  pull(query)

lad_cauth <-
  read_sf(query_url)

# Select and rename vars
lad_cauth <-
  lad_cauth |>
  select(
    ltla20_name = LAD20NM,
    ltla20_code = LAD20CD,
    cauth20_name = CAUTH20NM,
    cauth20_code = CAUTH20CD
  )

# Rename
lookup_ltla20_cauth20 <- lad_cauth

# Save output to data/ folder
usethis::use_data(lookup_ltla20_cauth20, overwrite = TRUE)
