# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# LAD lookup
lookup <-
  boundaries_counties_ua %>%
  select(-geometry) %>%
  as_tibble() %>%
  distinct(county_ua_name, county_ua_code)

# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "pop_counties_ua") %>%
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xls"))
)

pop <-
  read_excel(
    tf,
    sheet = "MYE2 - Persons",
    skip = 4
  )

# Keep only counties and unitary authorities
pop_counties_ua <-
  pop %>%
  rename(county_ua_code = Code) %>%
  right_join(lookup, by = "county_ua_code") %>%
  relocate(county_ua_name, .after = county_ua_code) %>%
  select(-Name, -Geography1) %>%
  rename(total_population = `All ages`)

# Rename
population_counties_ua <- pop_counties_ua

# Save output to data/ folder
usethis::use_data(population_counties_ua, overwrite = TRUE)