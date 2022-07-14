# ---- Load ----
library(tidyverse)
library(sf)
library(lobstr)
library(devtools)
library(httr)
library(sf)

# Load package
load_all(".")

# ---- Load NHS Trusts ----
# Set query url
query_url <-
  query_urls |>
  filter(id == "nhs_trusts22") |>
  pull(query)

# Load raw trust data
GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".zip"))
)
unzip(tf, exdir = tempdir())


trusts_raw <- read_csv(
  file = list.files(
    tempdir(),
    pattern = "etr.csv",
    full.names = TRUE
  ),
  col_names = c(
    "nhs_trust_code",
    "nhs_trust_name",
    "national_grouping",
    "high_level_health_geography",
    "address_1",
    "address2",
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
    nhs_trust22_code = nhs_trust_code,
    nhs_trust22_name = nhs_trust_name,
    nhs_region21_nhs_code = national_grouping,
    status
  )

# ---- Load NHS regions ----
# Set query url
query_url <-
  query_urls |>
  filter(id == "nhs_region21") |>
  pull(query)

nhs_region <-
  read_sf(query_url) |>
  st_drop_geometry()

nhs_region <-
  nhs_region |>
  select(
    nhs_region21_ons_code = NHSER21CD,
    nhs_region21_nhs_code = NHSER21CDH,
    nhs_region21_name = NHSER21NM
  )

# ---- Create lookup ----
lookup_nhs_trusts22_nhs_region21 <-
  trusts_clean |>
  left_join(nhs_region) |>
  relocate(status, .after = last_col())

# Save output to data/ folder
usethis::use_data(lookup_nhs_trusts22_nhs_region21, overwrite = TRUE)