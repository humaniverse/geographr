# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")


# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla19_utla19") |>
  pull(query)

ltla_utla <-
  read_sf(query_url)

ltla_utla <-
  ltla_utla |>
  select(
    ltla19_name = LTLA19NM,
    ltla19_code = LTLA19CD,
    utla19_name = UTLA19NM,
    utla19_code = UTLA19CD
  )

# Rename
lookup_ltla19_utla19 <- ltla_utla

# Save output to data/ folder
usethis::use_data(lookup_ltla19_utla19, overwrite = TRUE)
