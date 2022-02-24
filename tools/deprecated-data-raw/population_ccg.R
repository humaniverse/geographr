# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "pop_ccg") |>
  pull(query_url)

GET(query_url,
    write_disk(tf <- tempfile(fileext = ".zip")))

# Where to store the unzipped files temporarily
td <- tempdir()
unzip_dir <- file.path(td, "population-ccg")

# Delete the temp folder if it already exists
if (dir.exists(unzip_dir))
  unlink(unzip_dir, recursive = TRUE)

dir.create(unzip_dir)

unzip(tf, exdir = unzip_dir)

ccg_pop <- read_excel(file.path(unzip_dir, "SAPE22DT6a-mid-2019-ccg-2020-estimates-unformatted.xlsx"),
                      sheet = "Mid-2019 Persons", skip = 6)

# Select and rename vars
ccg_pop <-
  ccg_pop |>
  select(
    ccg_name = `CCG Name`,
    ccg_code = `CCG Code`,
    `total_population` = `All Ages`,
    `0`:`90+`
  ) |>
  slice(-1) |>  # First row is all NAs, so discard it
  distinct()

# Rename
population_ccg <- ccg_pop

# Save output to data/ folder
usethis::use_data(population_ccg, overwrite = TRUE)

unlink(tf); rm(tf)
unlink(td); rm(td)
