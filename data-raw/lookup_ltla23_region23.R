# ---- Load ----
library(tidyverse)
library(sf)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla23_region23") |>
  pull(query)

ltla_region <-
  read_sf(query_url)

# Select and rename vars
ltla_region <-
  ltla_region %>%
  st_drop_geometry() %>%
  select(
    ltla23_name = LAD23NM,
    ltla23_code = LAD23CD,
    region23_name = RGN23NM,
    region23_code = RGN23CD
  )

# Rename
lookup_ltla23_region23 <- ltla_region

# Save output to data/ folder
usethis::use_data(lookup_ltla23_region23, overwrite = TRUE)
