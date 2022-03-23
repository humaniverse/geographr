# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")


# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla20_utla20") |>
  pull(query)

ltla_utla <-
  read_sf(query_url)

ltla_utla <-
  ltla_utla |>
  select(
    ltla20_name = LTLA20NM,
    ltla20_code = LTLA20CD,
    utla20_name = UTLA20NM,
    utla20_code = UTLA20CD
  )

# Rename
lookup_ltla20_utla20 <- ltla_utla

# Save output to data/ folder
usethis::use_data(lookup_ltla20_utla20, overwrite = TRUE)
