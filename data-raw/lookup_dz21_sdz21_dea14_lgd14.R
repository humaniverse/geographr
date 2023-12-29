# Load
library(tidyverse)
library(devtools)
library(httr2)
library(readxl)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "dz21_sdz21_dea14_lgd14") |>
  pull(query)

# Download xls as temp file
download <- tempfile(fileext = ".xlsx")

request(query_url) |>
  req_perform(download)

raw <- read_excel(download,
                  sheet = "DZ2021_lookup")

lookup_dz21_sdz21_dea14_lgd14 <- raw |>
  rename_all(tolower) |>
  distinct()

# Save output to data/ folder
usethis::use_data(lookup_dz21_sdz21_dea14_lgd14, overwrite = TRUE)
