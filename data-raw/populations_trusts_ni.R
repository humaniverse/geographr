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
  filter(data_set == "pop_trusts_ni") %>%
  pull(query_url)

pop_raw <-
  read_csv(query_url)

pop <-
  pop_raw |>
  filter(Mid_Year_Ending == 2020) |>
  filter(Gender == "All persons") |>
  group_by(Geo_Code) |>
  mutate(total_population = sum(Population_Estimate)) |>
  ungroup() |>
  select(
    trust_name = Geo_Name,
    trust_code = Geo_Code,
    population = total_population
  ) |>
  distinct()

population_trusts_ni <- pop

# Save output to data/ folder
usethis::use_data(population_trusts_ni, overwrite = TRUE)