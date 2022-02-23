##
## Rural-urban classifications for Small Areas and Super Output Areas in Northern Ireland
##
# ---- Load ----
library(tidyverse)
library(devtools)
library(janitor)
library(readxl)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "ruc_ni") %>%
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xls"))
)

# Load Small Area classifications
ruc_ni <- read_excel(tf, sheet = "SA2011", skip = 3)

# Use another sheet for a Small Area -> Super Output Area lookup table
sa_soa <- read_excel(tf, sheet = "Allocation", skip = 3) %>%
  select(SA2011, SOA2011)

# Classifications
ruc_ni <- ruc_ni %>%
  select(SA2011_Code, `Settlement Classification Band`) %>%

  mutate(RUC = case_when(
    `Settlement Classification Band` %in% c("A", "B", "C", "D", "E") ~ "Urban",
    `Settlement Classification Band` %in% c("F", "G", "H") ~ "Rural"
  )) %>%

  mutate(Classification = case_when(
    `Settlement Classification Band` %in% c("A", "B") ~ "City",
    `Settlement Classification Band` %in% c("C", "D", "E") ~ "Town",
    `Settlement Classification Band` %in% c("F", "G", "H") ~ "Rural areas"
  ))

ruc_northern_ireland_sa <- ruc_ni %>%
  select(sa_code = SA2011_Code, ruc_code = `Settlement Classification Band`, RUC, Classification)

# Save output to data/ folder
usethis::use_data(ruc_northern_ireland_sa, overwrite = TRUE)

# - Super Output Areas -
# Classify SOAs by dichotomising into rural or urban
ruc_ni_soa <- ruc_ni %>%
  left_join(sa_soa, by = c("SA2011_Code" = "SA2011")) %>%

  tabyl(SOA2011, RUC) %>%
  mutate(`Proportion of urban areas` = Urban / (Urban + Rural)) %>%

  # categorise
  mutate(RUC = ifelse(`Proportion of urban areas` > 0.5, "Urban", "Rural")) %>%

  select(-Rural, -Urban)

# Classify MSOAs by whether they mostly contain urban connurbations, cities/towns, etc. in their constituent LSOAs
ruc_ni_soa_class <- ruc_ni %>%
  left_join(sa_soa, by = c("SA2011_Code" = "SA2011")) %>%

  tabyl(SOA2011, Classification) %>%

  pivot_longer(cols = -SOA2011, names_to = "Classification") %>%

  # Keep only the categories that appears most times in each MSOA
  # Source: https://stackoverflow.com/a/49587178
  group_by(SOA2011) %>%
  slice(which.max(value)) %>%
  ungroup() %>%

  select(-value)

ruc_northern_ireland_soa <- ruc_ni_soa %>%
  left_join(ruc_ni_soa_class, by = "SOA2011") %>%
  as_tibble() %>%
  rename(soa_code = SOA2011)

# Save output to data/ folder
usethis::use_data(ruc_northern_ireland_soa, overwrite = TRUE)

unlink(tf); rm(tf)
