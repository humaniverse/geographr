# ---- Load ----
library(tidyverse)
library(devtools)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "postcode_lad") %>%
  pull(query_url)

# GET and unzip file
GET(
  query_url,
  write_disk(zip_folder <- tempfile(fileext = ".zip"))
)

unzip(zip_folder, exdir = tempdir())

file <- file.path(tempdir(), "PCD_OA_LSOA_MSOA_LAD_MAY21_UK_LU.csv")

postcode_lad <-
  read_csv(file)

# Select and rename vars
postcode_lad <-
  postcode_lad %>%
  select(
    postcode = pcds,
    lad_name = ladnm,
    lad_code = ladcd
  )

# Keep distinct values and clean postcode column
postcode_lad <-
  postcode_lad %>%
  mutate(postcode = str_to_upper(postcode)) %>%
  mutate(postcode = str_remove_all(postcode, " ")) %>%
  distinct()

# Rename
lookup_postcode_lad <- postcode_lad

# Save output to data/ folder
usethis::use_data(lookup_postcode_lad, overwrite = TRUE)