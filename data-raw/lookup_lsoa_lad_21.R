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
  filter(id == "lsoa_lad_21") |>
  pull(query)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

lsoa_lad <- read_excel(tf)

# Select and rename vars
lsoa_lad <-
  lsoa_lad |>
  select(
    lsoa_11_name = LSOA11NM,
    lsoa_11_code = LSOA11CD,
    lad_21_name = LAD21NM,
    lad_21_code = LAD21CD
  )

# Rename
lookup_lsoa_lad_21 <- lsoa_lad

# Save output to data/ folder
usethis::use_data(lookup_lsoa_lad_21, overwrite = TRUE)
