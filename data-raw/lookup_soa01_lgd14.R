# Load
library(tidyverse)
library(devtools)
library(httr2)
library(readODS)

# Load package
devtools::load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "soa01_lgd14") |>
  pull(query)

# Download xls as temp file
download <- tempfile(fileext = ".ods")

request(query_url) |>
  req_perform(download)

raw <- read_ods(download,
                  sheet = "SOA2001_2_LGD2014", skip =2 )

lookup_soa01_lgd14 <- raw |>
  rename(soa01_code = SOA2001,
         lgd14_code = LGD2014,
         lgd14_name = LGD2014NAME) |>
  distinct()

# Save output to data/ folder
usethis::use_data(lookup_soa01_lgd14, overwrite = TRUE)
