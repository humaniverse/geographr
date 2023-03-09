# ---- Load ----
library(tidyverse)
library(devtools)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "postcode_oa21_lsoa21_msoa21_ltla22") |>
  pull(query)

# GET and unzip file
GET(
  query_url,
  write_disk(zip_folder <- tempfile(fileext = ".zip"))
)

unzip(zip_folder, exdir = tempdir())

file <- file.path(tempdir(), "PCD_OA21_LSOA21_MSOA21_LAD_NOV22_UK_LU.csv")

postcodes <-
  read_csv(file)

# Select and rename vars
postcode_oa_lsoa_msoa_lad <-
  postcodes |>
  select(
    postcode = pcds,
    oa121_code = oa21cd,
    lsoa21_code = lsoa21cd,
    msoa21_code = msoa21cd,
    ltla22_code = ladcd
  )

# Keep distinct values and clean postcode column
postcode_oa_lsoa_msoa_lad <-
  postcode_oa_lsoa_msoa_lad |>
  mutate(postcode = str_to_upper(postcode)) |>
  mutate(postcode = str_remove_all(postcode, " ")) |>
  distinct()

# Remove NI Postcodes which are distributed under their own license:
# https://www.ons.gov.uk/methodology/geography/licences

# Keep only Valid codes, as two "pseudo" codes appear in the data:
# "L99999999" & "M99999999"
postcode_oa_lsoa_msoa_lad <-
  postcode_oa_lsoa_msoa_lad |>
  filter(
    str_detect(ltla22_code, "^E") |
      str_detect(ltla22_code, "^W") |
      str_detect(ltla22_code, "^S")
  )

# Rename
lookup_postcode_oa21_lsoa21_msoa21_ltla22 <- postcode_oa_lsoa_msoa_lad

# Save output to data/ folder
usethis::use_data(lookup_postcode_oa21_lsoa21_msoa21_ltla22, overwrite = TRUE)
