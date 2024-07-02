# ---- Load ----
library(tidyverse)
library(devtools)
library(compositr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "scottish_postcode_directory") |>
  pull(query)

tf <- download_file(query_url, ".zip")

unzip(tf, exdir = tempdir())

list.files(tempdir())

postcodes <- read_csv(file.path(tempdir(), "SmallUser.csv"))

lookup_dz01_dz11 <-
  postcodes |>
  distinct(
    dz01_code = DataZone2001Code,
    dz11_code = DataZone2011Code
  )

# Save output to data/ folder
usethis::use_data(lookup_dz01_dz11, overwrite = TRUE)
