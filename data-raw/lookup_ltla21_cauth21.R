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
  filter(id == "ltla21_cauth21") |>
  pull(query)

GET(query_url,
    write_disk(tf <- tempfile(fileext = ".xlsx")))

ltla_cauth <- read_excel(tf)

# Select and rename vars
ltla_cauth <-
  ltla_cauth |>
  select(
    ltla21_name = LAD21NM,
    ltla21_code = LAD21CD,
    cauth21_name = CAUTH21NM,
    cauth21_code = CAUTH21CD
  )

# Rename
lookup_ltla21_cauth21 <- ltla_cauth

# Save output to data/ folder
usethis::use_data(lookup_ltla21_cauth21, overwrite = TRUE)
