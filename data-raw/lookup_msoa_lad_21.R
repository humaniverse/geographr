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
  filter(id == "msoa_lad_21") |>
  pull(query)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

msoa_lad <- read_excel(tf)

# Select and rename vars
msoa_lad <-
  msoa_lad |>
  select(
    msoa_11_name = MSOA11NM,
    msoa_11_code = MSOA11CD,
    lad_21_name = LAD21NM,
    lad_21_code = LAD21CD
  )

# Rename
lookup_msoa_lad_21 <- msoa_lad

# Save output to data/ folder
usethis::use_data(lookup_msoa_lad_21, overwrite = TRUE)
