library(tidyverse)
library(httr)
library(geographr)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "postcode_dz21_sdz21_dea14_lgd14") |>
  pull(query)

download <- tempfile(fileext = ".zip")
response <- GET(query_url, write_disk(download, overwrite = TRUE))
unzip(download, exdir = tempdir())

postcode_raw <- read_csv(file.path(tempdir(), "Data/ONSPD_NOV_2023_UK.csv"))

lookup_postcode_dz21_sdz21_dea14_lgd14 <- postcode_raw |>
  filter(str_detect(oslaua, "^N")) |>
  select(postcode = pcd,
       dz21_code = oa21) |>
  left_join(lookup_dz21_sdz21_dea14_lgd14, by = c("dz21_code")) |>
  mutate(postcode = str_replace_all(postcode, "\\s", ""))


# Save output to data/ folder
usethis::use_data(lookup_postcode_dz21_sdz21_dea14_lgd14, overwrite = TRUE)
