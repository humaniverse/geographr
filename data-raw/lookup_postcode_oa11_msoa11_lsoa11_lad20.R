# ---- Load ----
library(tidyverse)
library(devtools)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "postcode_oa11_lsoa11_msoa11_ltla20") |>
  pull(query)

# GET and unzip file
GET(
  query_url,
  write_disk(zip_folder <- tempfile(fileext = ".zip"))
)

unzip(zip_folder, exdir = tempdir())

file <- file.path(tempdir(), "NSPCL_NOV20_UK_LU.csv")

postcodes <-
  read_csv(file)

# Select and rename vars
postcode_oa_lsoa_msoa_lad <-
  postcodes |>
  select(
    postcode = pcds,
    oa11_code = oa11cd,
    lsoa11_code = lsoa11cd,
    msoa11_code = msoa11cd,
    ltla20_code = ladcd
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
    str_detect(ltla20_code, "^E") |
      str_detect(ltla20_code, "^W") |
      str_detect(ltla20_code, "^S")
  )

# Rename
lookup_postcode_oa11_lsoa11_msoa11_ltla20 <- postcode_oa_lsoa_msoa_lad

# Save output to data/ folder
usethis::use_data(lookup_postcode_oa11_lsoa11_msoa11_ltla20, overwrite = TRUE)
