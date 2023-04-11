library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "lsoa11_sicbl22_icb22_ltla22") |>
  pull(query)

lookup_raw <- read_csv(query_url)

# Select and rename vars
lookup_renamed <- lookup_raw |>
  select(
    lsoa11_name = LSOA11NM,
    lsoa11_code = LSOA11CD,
    sicbl22_name = SICBL22CD,
    sicbl22_code = SICBL22NM,
    icb22_name = ICB22CD,
    icb22_code = ICB22NM,
    ltla22_name = LAD22CD,
    ltla22_code = LAD22NM,
  ) |>
  distinct()

# Rename
lookup_lsoa11_sicbl22_icb22_ltla22 <- lookup_renamed

# Save output to data/ folder
usethis::use_data(lookup_lsoa11_sicbl22_icb22_ltla22, overwrite = TRUE)
