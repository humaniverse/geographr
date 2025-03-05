# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla24_fra24") |>
  pull(query)

ltla_fra <-
  read_sf(query_url)

# Select and rename vars
ltla_fra <-
  ltla_fra |>
  st_drop_geometry() |>
  select(
    ltla24_name = LAD24NM,
    ltla24_code = LAD24CD,
    fra24_name = FRA24NM,
    fra24_code = FRA24CD
  )

# Rename
lookup_ltla24_fra24 <- ltla_fra

# Save output to data/ folder
usethis::use_data(lookup_ltla24_fra24, overwrite = TRUE)
