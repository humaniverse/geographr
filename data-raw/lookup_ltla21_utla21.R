# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")


# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla21_utla21") |>
  pull(query)

lad_utla <-
  read_sf(query_url)

lad_utla <-
  lad_utla |>
  select(
    ltla21_name = LTLA21NM,
    ltla21_code = LTLA21CD,
    utla21_name = UTLA21NM,
    utla21_code = UTLA21CD
  )

# Rename
lookup_ltla21_utla21 <- lad_utla

# Save output to data/ folder
usethis::use_data(lookup_ltla21_utla21, overwrite = TRUE)
