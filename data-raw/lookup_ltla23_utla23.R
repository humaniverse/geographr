# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "ltla23_utla23") |>
  pull(query)

ltla23_utla23 <-
  read_sf(query_url)

# Select and rename vars
ltla23_utla23 <-
  ltla23_utla23 |>
  as.tibble() |>
  select(
    ltla23_code = LTLA23CD,
    ltla23_name = LTLA23NM,
    utla23_code = UTLA23CD,
    utla23_name = UTLA23NM
  )

# Rename
lookup_ltla23_utla23 <- ltla23_utla23

# Save output to data/ folder
usethis::use_data(lookup_ltla23_utla23, overwrite = TRUE)
