##
## Rural-urban classifications for LSOAs, MSOAs and Wards in England and Wales
##
# ---- Load ----
library(tidyverse)
library(devtools)
library(janitor)

# Load package
load_all(".")

# ---- Load England and Wales ----
# Set query url
ruc_eng_url <-
  query_urls |>
  filter(data_set == "ruc_england_wales") |>
  pull(query_url)

ruc_ew <- read_csv(ruc_eng_url)

# Classifications
ruc_ew <- ruc_ew |>
  select(LSOA11CD, RUC11CD) |>

  mutate(RUC = case_when(
    RUC11CD %in% c("A1", "B1", "C1", "C2") ~ "Urban",
    RUC11CD %in% c("D1", "D2", "E1", "E2", "F1", "F2") ~ "Rural"
  )) |>

  mutate(Classification = case_when(
    RUC11CD %in% c("A1", "B1") ~ "Urban conurbation",
    RUC11CD %in% c("C1", "C2") ~ "Urban city and town",
    RUC11CD %in% c("D1", "D2") ~ "Rural town and fringe",
    RUC11CD %in% c("E1", "E2") ~ "Rural village",
    RUC11CD %in% c("F1", "F2") ~ "rural hamlet and isolated dwellings"
  ))

ruc_england_wales_lsoa <- ruc_ew |>
  rename(lsoa_code = LSOA11CD, ruc_code = RUC11CD)

# Save output to data/ folder
usethis::use_data(ruc_england_wales_lsoa, overwrite = TRUE)

# - MSOAs -
# Classify MSOAs by dichotomising into rural or urban
ruc_ew_msoa <- ruc_ew |>
  left_join(lookup_lsoa_msoa, by = c("LSOA11CD" = "lsoa_code")) |>

  tabyl(msoa_code, RUC) |>
  mutate(`Proportion of urban areas` = Urban / (Urban + Rural)) |>

  # categorise
  mutate(RUC = ifelse(`Proportion of urban areas` > 0.5, "Urban", "Rural")) |>

  select(-Rural, -Urban)

# Classify MSOAs by whether they mostly contain urban connurbations, cities/towns, etc. in their constituent LSOAs
ruc_ew_msoa_class <- ruc_ew |>
  left_join(lookup_lsoa_msoa, by = c("LSOA11CD" = "lsoa_code")) |>

  tabyl(msoa_code, Classification) |>

  pivot_longer(cols = -msoa_code, names_to = "Classification") |>

  # Keep only the categories that appears most times in each MSOA
  # Source: https://stackoverflow.com/a/49587178
  group_by(msoa_code) |>
  slice(which.max(value)) |>
  ungroup() |>

  select(-value)

ruc_england_wales_msoa <- ruc_ew_msoa |>
  left_join(ruc_ew_msoa_class, by = "msoa_code") |>
  as_tibble()

# Save output to data/ folder
usethis::use_data(ruc_england_wales_msoa, overwrite = TRUE)

# - Wards -
# Classify wards by dichotomising into rural or urban
ruc_ew_ward <- ruc_ew |>
  left_join(lookup_lsoa_ward, by = c("LSOA11CD" = "lsoa_code")) |>

  tabyl(ward_code, RUC) |>
  mutate(`Proportion of urban areas` = Urban / (Urban + Rural)) |>

  # categorise
  mutate(RUC = ifelse(`Proportion of urban areas` > 0.5, "Urban", "Rural")) |>

  select(-Rural, -Urban)

# Classify wards by whether they mostly contain urban connurbations, cities/towns, etc. in their constituent LSOAs
ruc_ew_ward_class <- ruc_ew |>
  left_join(lookup_lsoa_ward, by = c("LSOA11CD" = "lsoa_code")) |>

  tabyl(ward_code, Classification) |>

  pivot_longer(cols = -ward_code, names_to = "Classification") |>

  # Keep only the categories that appears most times in each MSOA
  # Source: https://stackoverflow.com/a/49587178
  group_by(ward_code) |>
  slice(which.max(value)) |>
  ungroup() |>

  select(-value)

ruc_england_wales_ward <- ruc_ew_ward |>
  left_join(ruc_ew_ward_class, by = "ward_code") |>
  as_tibble()

# Save output to data/ folder
usethis::use_data(ruc_england_wales_ward, overwrite = TRUE)
