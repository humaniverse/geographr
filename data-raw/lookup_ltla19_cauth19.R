# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla19_cauth19") |>
  pull(query)

ltla_cauth <-
  read_sf(query_url)

# Select and rename vars
ltla_cauth <-
  ltla_cauth |>
  select(
    ltla19_name = LAD19NM,
    ltla19_code = LAD19CD,
    cauth19_name = CAUTH19NM,
    cauth19_code = CAUTH19CD
  )

# Rename
lookup_ltla19_cauth19 <- ltla_cauth

# Save output to data/ folder
usethis::use_data(lookup_ltla19_cauth19, overwrite = TRUE)
