# ---- Load ----
library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "sa11_soa11_lgd18") |>
  pull(query)

sa_soa_lgd <- read_csv(query_url)

# Select and rename vars
lookup_sa11_soa11_lgd18 <-
  sa_soa_lgd |>
  select(
    sa11_code = SA11CD,
    soa11_name = LSOA11NM,
    soa11_code = LSOA11CD,
    lgd18_name = LAD18NM,
    lgd18_code = LAD18CD
  ) |>
  distinct()

# Save output to data/ folder
usethis::use_data(lookup_sa11_soa11_lgd18, overwrite = TRUE)
