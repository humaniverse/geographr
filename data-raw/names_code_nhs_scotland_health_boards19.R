# ---- Load ----
library(tidyverse)
library(devtools)
library(lubridate)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "nhs_scotland_health_boards19") |>
  pull(query)

nhs_scotland_health_boards19 <- read_csv(query_url)

nhs_scotland_health_boards19 <-
  nhs_scotland_health_boards19 |>
  mutate(
    HBDateEnacted = ymd(HBDateEnacted),
    HBDateArchived = ymd(HBDateArchived)
  ) |>

  select(
    hb19_name = HBName,
    hb19_code = HB,
    date_enacted = HBDateEnacted,
    date_archived = HBDateArchived
  )

names_codes_hb19 <- nhs_scotland_health_boards19

# Save output to data/ folder
usethis::use_data(names_codes_hb19, overwrite = TRUE)
