# ---- Load ----
library(tidyverse)
library(sf)
library(devtools)

# Load package
load_all(".")

# ---- Load MSOA area data ----
# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "msoa") %>%
  pull(query_url)

msoa <-
  read_sf(query_url)

# Select and rename vars
msoa <-
  msoa %>%
  select(
    msoa_code = MSOA11CD,
    area_m_squared = Shape__Area
  ) %>%
  mutate(area_km_squared = area_m_squared / 1000^2) %>%
  select(-area_m_squared) %>%
  st_drop_geometry()

# ---- Load MSOA population estimates ----
msoa_pop <-
  population_msoa %>%
  select(msoa_code, total_population)

density_msoa <-
  msoa %>%
  left_join(msoa_pop) %>%
  mutate(density = total_population / area_km_squared)

# Save output to data/ folder
usethis::use_data(density_msoa, overwrite = TRUE)
