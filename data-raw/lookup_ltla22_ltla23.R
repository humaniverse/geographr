# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla22_ltla23") |>
  pull(query)

ltla22_ltla23 <-
  read_sf(query_url)

# Select and rename vars
ltla22_ltla23 <-
  ltla22_ltla23 |>
  as.tibble() |>
  select(
    ltla22_code = LAD22CD,
    ltla22_name = LAD22NM,
    ltla23_code = LAD23CD,
    ltla23_name = LAD23NM
  )

# Rename
lookup_ltla22_ltla23 <- ltla22_ltla23

# Save output to data/ folder
usethis::use_data(lookup_ltla22_ltla23, overwrite = TRUE)
