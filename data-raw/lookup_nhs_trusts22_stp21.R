# ---- Load ----
library(tidyverse)
library(sf)
library(devtools)

# Load package
load_all(".")

# ---- Calculate intersection ----
intersections <-
  st_intersection(
    points_nhs_trusts22 |> filter(status == "open"),
    boundaries_stp21
  ) |>
  st_drop_geometry() |>
  select(-status)

# All missing Trusts are Welsh
missing_trusts <-
  points_nhs_trusts22 |>
  st_drop_geometry() |>
  filter(status == "open") |>
  filter(!(nhs_trust22_name %in% intersections$nhs_trust22_name))

lookup_nhs_trusts22_stp21 <- intersections

# Save output to data/ folder
usethis::use_data(lookup_nhs_trusts22_stp21, overwrite = TRUE)