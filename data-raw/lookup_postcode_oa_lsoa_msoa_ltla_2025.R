library(tidyverse)
library(httr2)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "postcode_oa_lsoa_msoa_ltla_2025") |>
  pull(query)

download <- tempfile(fileext = ".zip")
request(query_url) |> req_perform(path = download)
unzip(download, exdir = tempdir())

# Find filename
# list.files(file.path(tempdir(), "Data"))

postcode_raw <- read_csv(file.path(tempdir(), "Data/ONSPD_FEB_2025_UK.csv"))

lookup_postcode_oa_lsoa_msoa_ltla_2025 <-
  postcode_raw |>
  select(
    postcode = pcd,

    oa11_code = oa11,
    lsoa11_code = lsoa11,
    msoa11_code = msoa11,

    oa21_code = oa21,
    lsoa21_code = lsoa21,
    msoa21_code = msoa21,

    ltla24_code = oslaua
  )

# Save output to data/ folder
usethis::use_data(lookup_postcode_oa_lsoa_msoa_ltla_2025, overwrite = TRUE)
