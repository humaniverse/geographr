# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "pop_soa") %>%
  pull(query_url)

GET(query_url,
    write_disk(tf <- tempfile(fileext = ".xlsx")))

soa_pop <- read_excel(tf, sheet = "Flat")

# Select and rename vars
population_soa <-
  soa_pop %>%

  filter(area == "1. Super Output Areas" & year == "2019") %>%
  pivot_wider(names_from = age, values_from = MYE) %>%

  # Rename gender column and relabel for consistency with other nations' population estimates
  mutate(sex = case_when(
    gender == "All persons" ~ "All",
    gender == "Males" ~ "Male",
    gender == "Females" ~ "Female"
  )) %>%

  select(
    soa_name = area_name,
    soa_code = area_code,
    `total_population` = `All ages`,
    sex,
    `00-15`:`65+`
  ) %>%

  distinct()

# Save output to data/ folder
usethis::use_data(population_soa, overwrite = TRUE)

unlink(tf); rm(tf)
