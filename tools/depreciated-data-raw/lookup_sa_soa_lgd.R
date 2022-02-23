# ---- Load ----
library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "sa_soa_lgd") |>
  pull(query_url)

sa_soa_lgd <- read_csv(query_url)

# Select and rename vars
lookup_sa_soa_lgd <-
  sa_soa_lgd |>
  select(
    sa_code = SA11CD,
    soa_name = LSOA11NM,
    soa_code = LSOA11CD,
    lgd_name = LAD18NM,
    lgd_code = LAD18CD
  ) |>
  distinct()

# Save output to data/ folder
usethis::use_data(lookup_sa_soa_lgd, overwrite = TRUE)
