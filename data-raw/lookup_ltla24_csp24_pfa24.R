# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)


# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla24_csp24_pfa24") |>
  pull(query)

ltla24_csp24_pfa24 <-
  read_sf(query_url)


# Select and rename vars
ltla24_csp24_pfa24 <-
  ltla24_csp24_pfa24 |>
  as.tibble() |>
  select(
    ltla24_code = LAD24CD,
    ltla24_name = LAD24NM,
    csp24_code = CSP24CD,
    csp24_name = CSP24NM,
    pfa24_code = PFA24CD,
    pfa24_name = PFA24NM
  )

# Rename
lookup_ltla24_csp24_pfa24 <- ltla24_csp24_pfa24

# Save output to data/ folder
usethis::use_data(lookup_ltla24_csp24_pfa24, overwrite = TRUE)
