# Load
library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(id == "dz11_ltla19_hb19") |>
  pull(query)

raw <- read_csv(query_url)

lookup_dz11_ltla19_hb19 <- raw |> 
  select(
    dz11_code = DataZone,
    ltla19_code = CA,
    hb19_code = HB
  ) |> 
  distinct()

# Save output to data/ folder
usethis::use_data(lookup_dz11_ltla19_hb19, overwrite = TRUE)
