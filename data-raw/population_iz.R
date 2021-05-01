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
  filter(data_set == "pop_iz") %>%
  pull(query_url)

iz_pop <- read_csv(query_url)

population_iz <-
  iz_pop %>%

  # Keep only latest year and don't include Scotland totals
  filter(Year == max(Year) & IntZone != "S92000003") %>%

  # Select and rename vars
  select(
    iz_code = `IntZone`,
    `total_population` = AllAges,
    sex = Sex,
    Age0:Age90plus
  ) %>%

  # Rename single years of age columns in line with England and Wales' naming
  rename_with(~ str_remove(.x, "Age"), starts_with("Age")) %>%
  rename(`90+` = `90plus`)

# Save output to data/ folder
usethis::use_data(population_iz, overwrite = TRUE)
