# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)

# Load package
load_all(".")

# ---- Load England and Wales ----
# Set query url
query_url <-
  query_urls |>
  filter(id == "ruc11_lsoa11") |>
  pull(query)

ruc_lsoa <-
  read_sf(query_url) |>
  st_drop_geometry()

# Classifications
ruc_lsoa <-
  ruc_lsoa |>
  select(LSOA11CD, RUC11CD) |>
  mutate(
    RUC = case_when(
      RUC11CD %in% c("A1", "B1", "C1", "C2") ~ "Urban",
      RUC11CD %in% c("D1", "D2", "E1", "E2", "F1", "F2") ~ "Rural"
    )
  ) |>
  mutate(
    Classification = case_when(
      RUC11CD %in% c("A1", "B1") ~ "Urban conurbation",
      RUC11CD %in% c("C1", "C2") ~ "Urban city and town",
      RUC11CD %in% c("D1", "D2") ~ "Rural town and fringe",
      RUC11CD %in% c("E1", "E2") ~ "Rural village",
      RUC11CD %in% c("F1", "F2") ~ "rural hamlet and isolated dwellings"
    )
  )

ruc_lsoa <-
  ruc_lsoa |>
  rename(lsoa11_code = LSOA11CD, ruc1111_code = RUC11CD)

# Rename
ruc11_lsoa11 <- ruc_lsoa

# Save output to data/ folder
usethis::use_data(ruc11_lsoa11, overwrite = TRUE)
