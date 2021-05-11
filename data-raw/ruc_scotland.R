##
## Rural-urban classifications for Data Zones and Intermediate Zones in Scotland
##
# ---- Load ----
library(tidyverse)
library(devtools)
library(janitor)
# library(httr)

# Load package
load_all(".")

# ---- Load Data Zone classifications ----
# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "ruc_scotland") %>%
  pull(query_url)

ruc_dz <- read_csv(query_url)

# Classifications
ruc_dz <-
  ruc_dz %>%
  select(DZ_CODE, UR6FOLD) %>%

  mutate(RUC = case_when(
    UR6FOLD <= 4 ~ "Urban",
    UR6FOLD >= 5 ~ "Rural"
  )) %>%

  mutate(Classification = case_when(
    UR6FOLD %in% c(1) ~ "Large urban areas",
    UR6FOLD %in% c(2) ~ "Other urban areas",
    UR6FOLD %in% c(3, 4) ~ "Small towns",
    UR6FOLD %in% c(5, 6) ~ "Rural areas"
  ))

ruc_scotland_dz <- ruc_dz %>%
  select(dz_code = DZ_CODE, ruc_code = UR6FOLD, RUC, Classification)

# Save output to data/ folder
usethis::use_data(ruc_scotland_dz, overwrite = TRUE)

# - Intermediate Zones -
# Classify MSOAs by dichotomising into rural or urban
ruc_iz <-
  ruc_scotland_dz %>%
  left_join(lookup_dz_iz_lad, by = "dz_code") %>%

  tabyl(iz_code, RUC) %>%
  mutate(`Proportion of urban areas` = Urban / (Urban + Rural)) %>%

  # categorise
  mutate(RUC = ifelse(`Proportion of urban areas` > 0.5, "Urban", "Rural")) %>%

  select(-Rural, -Urban) %>%
  as_tibble()

# Classify MSOAs by whether they mostly contain urban connurbations, cities/towns, etc. in their constituent LSOAs
ruc_iz_class <-
  ruc_scotland_dz %>%
  left_join(lookup_dz_iz_lad, by = "dz_code") %>%

  tabyl(iz_code, Classification) %>%

  pivot_longer(cols = -iz_code, names_to = "Classification") %>%

  # Keep only the categories that appears most times in each MSOA
  # Source: https://stackoverflow.com/a/49587178
  group_by(iz_code) %>%
  slice(which.max(value)) %>%
  ungroup() %>%

  select(-value) %>%
  as_tibble()

ruc_scotland_iz <- ruc_iz %>%
  left_join(ruc_iz_class, by = "iz_code") %>%
  as_tibble()

# Save output to data/ folder
usethis::use_data(ruc_scotland_iz, overwrite = TRUE)
