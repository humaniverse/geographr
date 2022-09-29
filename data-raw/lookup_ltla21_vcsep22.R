# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")


# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla21_vcsep22") |>
  pull(query)

# Rename
lookup_ltla21_vcsep22 <-  read_sf(query_url)

# Save output to data/ folder
usethis::use_data(lookup_ltla21_vcsep22, overwrite = TRUE)
