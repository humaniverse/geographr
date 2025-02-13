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

# ---- Create lookup for LTLA 2016 to 2019 ----
# Fetch LTLA codes and names for 2016
# Source: https://geoportal.statistics.gov.uk/datasets/ons::local-authority-districts-december-2016-names-and-codes-in-the-uk/about
ltla16 <- read_sf("https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/LAD_Dec_2016_Names_and_Codes_in_the_United_Kingdom_2022/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson")

# Select LAD code and names
ltla16 <- ltla16 |>
  st_drop_geometry() |>
  distinct(
    LAD16NM,
    LAD16CD
  )

# Find changes 2016 --> 2017
changes_2017 <-
  ltla16 |>
  left_join(
    filter(all_changes, year_prev == 2016),
    by = c("LAD16CD" = "code_prev")
  ) |>
  distinct(LAD16CD,
           LAD16NM,
           LAD17CD = code_new,
           LAD17NM = name_new
  ) |>
  mutate(LAD17CD = if_else(is.na(LAD17CD), LAD16CD, LAD17CD)) |>
  mutate(LAD17NM = if_else(is.na(LAD17NM), LAD16NM, LAD17NM))

# Find changes 2017 --> 2018
changes_2018 <-
  changes_2017 |>
  left_join(
    filter(all_changes, year_prev == 2017),
    by = c("LAD17CD" = "code_prev")
  ) |>
  distinct(LAD17CD,
           LAD17NM,
           LAD18CD = code_new,
           LAD18NM = name_new
  ) |>
  mutate(LAD18CD = if_else(is.na(LAD18CD), LAD17CD, LAD18CD)) |>
  mutate(LAD18NM = if_else(is.na(LAD18NM), LAD17NM, LAD18NM))

# Find changes 2018 --> 2019
changes_2019 <-
  changes_2018 |>
  left_join(
    filter(all_changes, year_prev == 2018),
    by = c("LAD18CD" = "code_prev")
  ) |>
  distinct(LAD18CD,
           LAD18NM,
           LAD19CD = code_new,
           LAD19NM = name_new
  ) |>
  mutate(LAD19CD = if_else(is.na(LAD19CD), LAD18CD, LAD19CD)) |>
  mutate(LAD19NM = if_else(is.na(LAD19NM), LAD18NM, LAD19NM))

# Find changes 2019 --> 2020
changes_2020 <-
  changes_2019 |>
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

# Find changes 2020 --> 2021
changes_2021 <-
  changes_2020 |>
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

# Find changes 2021 --> 2022
changes_2022 <-
  changes_2021 |>
  left_join(
    filter(all_changes, year_prev == 2021),
    by = c("LAD21CD" = "code_prev")
  ) |>
  distinct(LAD21CD,
           LAD21NM,
           LAD22CD = code_new,
           LAD22NM = name_new
  ) |>
  mutate(LAD22CD = if_else(is.na(LAD22CD), LAD21CD, LAD22CD)) |>
  mutate(LAD22NM = if_else(is.na(LAD22NM), LAD21NM, LAD22NM))

# Find changes 2022 --> 2023
changes_2023 <-
  changes_2022 |>
  left_join(
    filter(all_changes, year_prev == 2022),
    by = c("LAD22CD" = "code_prev")
  ) |>
  distinct(LAD22CD,
           LAD22NM,
           LAD23CD = code_new,
           LAD23NM = name_new
  ) |>
  mutate(LAD23CD = if_else(is.na(LAD23CD), LAD22CD, LAD23CD)) |>
  mutate(LAD23NM = if_else(is.na(LAD23NM), LAD22NM, LAD23NM))

# Find changes 2023 --> 2024
changes_2024 <-
  changes_2023 |>
  left_join(
    filter(all_changes, year_prev == 2023),
    by = c("LAD23CD" = "code_prev")
  ) |>
  distinct(LAD23CD,
           LAD23NM,
           LAD24CD = code_new,
           LAD24NM = name_new
  ) |>
  mutate(LAD24CD = if_else(is.na(LAD24CD), LAD23CD, LAD24CD)) |>
  mutate(LAD24NM = if_else(is.na(LAD24NM), LAD23NM, LAD24NM))

# Combine changes
combined_changes <-
  changes_2017 |>

  full_join(
    changes_2018,
    by = c("LAD17CD", "LAD17NM")
  ) |>

  full_join(
    changes_2019,
    by = c("LAD18CD", "LAD18NM")
  ) |>

  full_join(
    changes_2020,
    by = c("LAD19CD", "LAD19NM")
  ) |>

  full_join(
    changes_2021,
    by = c("LAD20CD", "LAD20NM")
  ) |>

  full_join(
    changes_2022,
    by = c("LAD21CD", "LAD21NM")
  ) |>

  full_join(
    changes_2023,
    by = c("LAD22CD", "LAD22NM")
  ) |>

  full_join(
    changes_2024,
    by = c("LAD23CD", "LAD23NM")
  )

# Rename cols
combined_changes_renamed <-
  combined_changes |>
  rename(
    ltla16_name = LAD16NM,
    ltla16_code = LAD16CD,
    ltla17_name = LAD17NM,
    ltla17_code = LAD17CD,
    ltla18_name = LAD18NM,
    ltla18_code = LAD18CD,
    ltla19_name = LAD19NM,
    ltla19_code = LAD19CD,
    ltla20_name = LAD20NM,
    ltla20_code = LAD20CD,
    ltla21_name = LAD21NM,
    ltla21_code = LAD21CD,
    ltla22_name = LAD22NM,
    ltla22_code = LAD22CD,
    ltla23_name = LAD23NM,
    ltla23_code = LAD23CD,
    ltla24_name = LAD24NM,
    ltla24_code = LAD24CD
  )

# Check object is below 50Mb GitHub warning limit
if (obj_size(combined_changes_renamed) > 50000000) {
  stop("File is too large")
}

# Rename
lookup_ltla_ltla <- combined_changes_renamed

# Save output to data/ folder
usethis::use_data(lookup_ltla_ltla, overwrite = TRUE)
