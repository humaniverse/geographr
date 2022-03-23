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
  filter(id == "msoa11_ltla21") |>
  pull(query)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

msoa_ltla <- read_excel(tf)

# Select and rename vars
msoa_ltla <-
  msoa_ltla |>
  select(
    msoa11_name = MSOA11NM,
    msoa11_code = MSOA11CD,
    ltla21_name = LAD21NM,
    ltla21_code = LAD21CD
  )

# Rename
lookup_msoa11_ltla21 <- msoa_ltla

# Save output to data/ folder
usethis::use_data(lookup_msoa11_ltla21, overwrite = TRUE)
