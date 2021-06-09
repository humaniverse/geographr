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

file <- file.path(tempdir(), "NSPCL_NOV20_UK_LU.csv")

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

# Remove NI Postcodes which are distributed under their own license:
# https://www.ons.gov.uk/methodology/geography/licences

# Keep only Valid codes, as two "pseudo" codes appear in the data:
# "L99999999" & "M99999999"
postcode_lad <-
  postcode_lad %>%
  filter(
    str_detect(lad_code, "^E") |
      str_detect(lad_code, "^W") |
      str_detect(lad_code, "^S")
  )

# LAD names for Buckinghamshire unitary authority "E06000060"
postcode_lad <-
  postcode_lad %>%
  mutate(
    lad_name = if_else(
      lad_code == "E06000060",
      "Buckinghamshire",
      lad_name
    )
  )

# Rename
lookup_postcode_lad <- postcode_lad

# Save output to data/ folder
usethis::use_data(lookup_postcode_lad, overwrite = TRUE)