# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "dz11_iz11_ltla20") |>
  pull(query)

GET(query_url,
    write_disk(tf <- tempfile(fileext = ".xlsx")))

dz_iz_lad <- read_excel(tf, sheet = "SIMD 2020v2 DZ lookup data")

# Select and rename vars
lookup_dz11_iz11_ltla20 <-
  dz_iz_lad |>
  select(
    dz11_name = DZname,
    dz11_code = DZ,
    iz11_name = IZname,
    iz11_code = IZcode,
    ltla20_name = LAname,
    ltla20_code = LAcode
  ) |>
  distinct()

# Save output to data/ folder
usethis::use_data(lookup_dz11_iz11_ltla20, overwrite = TRUE)
