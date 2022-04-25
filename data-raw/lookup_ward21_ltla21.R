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
  filter(id == "ward21_ltla21") |>
  pull(query)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

ward_ltla <- read_excel(tf)

# Select and rename vars
ward_ltla <-
  ward_ltla |>
  select(
    ward21_name = WD21NM,
    ward21_code = WD21CD,
    ltla21_name = LAD21NM,
    ltla21_code = LAD21CD
  )

# Rename
lookup_ward21_ltla21 <- ward_ltla

# Save output to data/ folder
usethis::use_data(lookup_ward21_ltla21, overwrite = TRUE)