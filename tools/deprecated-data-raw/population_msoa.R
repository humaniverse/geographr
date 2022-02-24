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
  filter(data_set == "pop_msoa") |>
  pull(query_url)

GET(query_url,
    write_disk(tf <- tempfile(fileext = ".zip")))

# Where to store the unzipped files temporarily
td <- tempdir()
unzip_dir <- file.path(td, "population-msoa")

# Delete the temp folder if it already exists
if (dir.exists(unzip_dir))
  unlink(unzip_dir, recursive = TRUE)

dir.create(unzip_dir)

unzip(tf, exdir = unzip_dir)

msoa_pop <- read_excel(file.path(unzip_dir, "SAPE22DT4-mid-2019-msoa-syoa-estimates-unformatted.xlsx"),
                       sheet = "Mid-2019 Persons", skip = 4)

# Select and rename vars
msoa_pop <-
  msoa_pop |>
  select(
    msoa_name = `MSOA Name`,
    msoa_code = `MSOA Code`,
    `total_population` = `All Ages`,
    `0`:`90+`
  ) |>
  distinct()

# Rename
population_msoa <- msoa_pop

# Save output to data/ folder
usethis::use_data(population_msoa, overwrite = TRUE)

unlink(tf); rm(tf)
unlink(td); rm(td)
