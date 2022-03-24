# ---- Load ----
library(tidyverse)
library(sf)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla19_region19") |>
  pull(query)

ltla_region <-
  read_sf(query_url)

# Select and rename vars
ltla_region <-
  ltla_region %>%
  st_drop_geometry() %>%
  select(
    ltla19_name = LAD19NM,
    ltla19_code = LAD19CD,
    region19_name = RGN19NM,
    region19_code = RGN19CD
  )

# Rename
lookup_ltla19_region19 <- ltla_region

# Save output to data/ folder
usethis::use_data(lookup_ltla19_region19, overwrite = TRUE)
