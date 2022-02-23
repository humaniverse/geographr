# ---- Load ----
library(tidyverse)
library(httr)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "nhs_trusts") |>
  pull(query_url)

# Load raw trust data
GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".zip"))
)
unzip(tf, exdir = tempdir())
unlink(tf)

trusts_raw <- read_csv(
  file = list.files(
    tempdir(),
    pattern = "*.csv",
    full.names = TRUE
  ),
  col_names = c(
    "nhs_trust_code",
    "nhs_trust_name",
    "national_grouping",
    "high_level_health_geography",
    "address_1",
    "address_2",
    "address_3",
    "address_4",
    "address_5",
    "postcode",
    "open_date",
    "close_date"
  )
)

# Create open status
trusts_clean <-
  trusts_raw |>
  mutate(status = if_else(is.na(close_date), "open", "closed")) |>
  select(
    -open_date,
    -close_date
  )

# Drop cols
trusts_clean <-
  trusts_clean |>
  select(
    nhs_trust_code,
    stp_code = high_level_health_geography,
    status
  )

# Rename
lookup_trust_stp <- trusts_clean

# Save output to data/ folder
usethis::use_data(lookup_trust_stp, overwrite = TRUE)
