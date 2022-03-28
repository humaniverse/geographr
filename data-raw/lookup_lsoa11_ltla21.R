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
  filter(id == "lsoa11_ltla21") |>
  pull(query)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

lsoa_ltla <- read_excel(tf)

# Select and rename vars
lsoa_ltla <-
  lsoa_ltla |>
  select(
    lsoa11_name = LSOA11NM,
    lsoa11_code = LSOA11CD,
    ltla21_name = LAD21NM,
    ltla21_code = LAD21CD
  )

# Rename
lookup_lsoa11_ltla21 <- lsoa_ltla

# Save output to data/ folder
usethis::use_data(lookup_lsoa11_ltla21, overwrite = TRUE)
