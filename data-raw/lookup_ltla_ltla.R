# ---- Load ----
library(httr)
library(tidyverse)
library(sf)
library(devtools)
library(lobstr)

# Load package
load_all(".")

query_url_changes <-
  query_urls |>
  filter(id == "ltla_ltla") |>
  pull(query)

# GET and unzip change data
GET(
  query_url_changes,
  write_disk(
    zip_folder <- tempfile(fileext = ".zip")
  )
)

unzip(zip_folder, exdir = tempdir())

all_changes <-
  read_csv(
    file.path(
      tempdir(),
      "Changes.csv"
    )
  )

# Clean up columns
all_changes <-
  all_changes |>
  distinct(
    GEOGCD,
    GEOGNM,
    GEOGCD_P,
    GEOGNM_P,
    YEAR
  ) |>
  mutate(year_prev = YEAR - 1) |>
  rename(
    code_new = GEOGCD,
    name_new = GEOGNM,
    code_prev = GEOGCD_P,
    name_prev = GEOGNM_P,
    year_new = YEAR
  )

# Pull in 2019 LAD codes & names
query_url_lad <-
  query_urls |>
  filter(id == "ltla19") |>
  pull(query)

ltla19 <- read_sf(query_url_lad)

# Select LAD code and names
ltla19 <- ltla19 |>
  st_drop_geometry() |>
  distinct(
    LAD19NM = lad19nm,
    LAD19CD = lad19cd
  )

# Take 2020 changes and apply to 2019 data
changes_2020 <-
  ltla19 |>
  left_join(
    filter(all_changes, year_prev == 2019),
    by = c("LAD19CD" = "code_prev")
  ) |>
  distinct(LAD19CD,
    LAD19NM,
    LAD20CD = code_new,
    LAD20NM = name_new
  ) |>
  mutate(LAD20CD = if_else(is.na(LAD20CD), LAD19CD, LAD20CD)) |>
  mutate(LAD20NM = if_else(is.na(LAD20NM), LAD19NM, LAD20NM))

# Take 2021 changes and apply to 2020 data
changes_2021 <- changes_2020 |>
  left_join(
    filter(all_changes, year_prev == 2020),
    by = c("LAD20CD" = "code_prev")
  ) |>
  distinct(LAD20CD,
    LAD20NM,
    LAD21CD = code_new,
    LAD21NM = name_new
  ) |>
  mutate(LAD21CD = if_else(is.na(LAD21CD), LAD20CD, LAD21CD)) |>
  mutate(LAD21NM = if_else(is.na(LAD21NM), LAD20NM, LAD21NM))

# Combine changes
combined_changes <-
  changes_2020 |>
  left_join(
    changes_2021,
    by = c("LAD20CD", "LAD20NM")
  )

# Rename cols
combined_changes_renamed <-
  combined_changes |>
  rename(
    ltla19_name = LAD19NM,
    ltla19_code = LAD19CD,
    ltla20_name = LAD20NM,
    ltla20_code = LAD20CD,
    ltla21_name = LAD21NM,
    ltla21_code = LAD21CD,
  )

# Check object is below 50Mb GitHub warning limit
if (obj_size(combined_changes_renamed) > 50000000) {
  stop("File is too large")
}

# Rename
lookup_ltla_ltla <- combined_changes_renamed

# Save output to data/ folder
usethis::use_data(lookup_ltla_ltla, overwrite = TRUE)
