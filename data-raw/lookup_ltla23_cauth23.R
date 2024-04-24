# ---- Load ----
library(tidyverse)
library(devtools)
library(httr)
library(readxl)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla23_cauth23") |>
  pull(query)

ltla_cauth <-
  read_sf(query_url)

# Select and rename vars
ltla_cauth <-
  ltla_cauth |>
  st_drop_geometry() %>%
  select(
    ltla23_name = LAD23NM,
    ltla23_code = LAD23CD,
    cauth23_name = CAUTH23NM,
    cauth23_code = CAUTH23CD
  )

# Rename
lookup_ltla23_cauth23 <- ltla_cauth

# Save output to data/ folder
usethis::use_data(lookup_ltla23_cauth23, overwrite = TRUE)
