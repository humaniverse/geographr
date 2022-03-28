# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla21_fra21") |>
  pull(query)

ltla_fra <-
  read_sf(query_url)

# Select and rename vars
ltla_fra <-
  ltla_fra |>
  select(
    ltla21_name = LAD21NM,
    ltla21_code = LAD21CD,
    fra21_name = FRA21NM,
    fra21_code = FRA21CD
  )

# Rename
lookup_ltla21_fra21 <- ltla_fra

# Save output to data/ folder
usethis::use_data(lookup_ltla21_fra21, overwrite = TRUE)
