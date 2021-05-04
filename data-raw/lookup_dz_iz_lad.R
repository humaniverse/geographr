# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "dz_iz_lad") %>%
  pull(query_url)

GET(query_url,
    write_disk(tf <- tempfile(fileext = ".xlsx")))

dz_iz_lad <- read_excel(tf, sheet = "SIMD 2020v2 DZ lookup data")

# Select and rename vars
lookup_dz_iz_lad <-
  dz_iz_lad %>%
  select(
    dz_name = DZname,
    dz_code = DZ,
    iz_name = IZname,
    iz_code = IZcode,
    lad_name = LAname,
    lad_code = LAcode
  ) %>%
  distinct()

# Save output to data/ folder
usethis::use_data(lookup_dz_iz_lad, overwrite = TRUE)
