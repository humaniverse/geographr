# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla21_lhb22") |>
  pull(query)

ltla_lhb <-
  read_sf(query_url)

ltla_lhb <-
  ltla_lhb |>
  st_drop_geometry() |>
  select(
    ltla21_code = UA22CD,
    ltla21_name = UA22NM,
    lhb22_code = LHB22CD,
    lhb22_name = LHB22NM
  )

# Rename
lookup_ltla21_lhb22 <- ltla_lhb

# Save output to data/ folder
usethis::use_data(lookup_ltla21_lhb22, overwrite = TRUE)
