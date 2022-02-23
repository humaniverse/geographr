# ---- Load ----
library(tidyverse)
library(devtools)
library(sf)
library(janitor)

# Load package
load_all(".")

# ---- Load England and Wales ----
# Set query url
query_url <-
  query_urls %>%
  filter(id == "ruc_wards_11") %>%
  pull(query)

ruc_wards <-
  read_sf(query_url) |>
  st_drop_geometry()

# Classifications
ruc_wards <-
  ruc_wards %>%
  select(WD11CD, RUC11CD) %>%
  mutate(
    RUC = case_when(
      RUC11CD %in% c("A1", "B1", "C1", "C2") ~ "Urban",
      RUC11CD %in% c("D1", "D2", "E1", "E2", "F1", "F2") ~ "Rural"
    )
  ) %>%
  mutate(
    Classification = case_when(
      RUC11CD %in% c("A1", "B1") ~ "Urban conurbation",
      RUC11CD %in% c("C1", "C2") ~ "Urban city and town",
      RUC11CD %in% c("D1", "D2") ~ "Rural town and fringe",
      RUC11CD %in% c("E1", "E2") ~ "Rural village",
      RUC11CD %in% c("F1", "F2") ~ "rural hamlet and isolated dwellings"
    )
  )

ruc_wards <-
  ruc_wards %>%
  rename(ward_11_code = WD11CD, ruc_11_code = RUC11CD)

# Rename
ruc_wards_11 <- ruc_wards

# Save output to data/ folder
usethis::use_data(ruc_wards_11, overwrite = TRUE)