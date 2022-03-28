# ---- Load ----
library(tidyverse)
library(devtools)

# Load package
load_all(".")

# ---- Load Data Zone classifications ----
# Set query url
query_url <-
  query_urls |>
  filter(id == "ruc16_dz11") |>
  pull(query)

ruc_dz <- read_csv(query_url)

# Classifications
ruc_dz <-
  ruc_dz |>
  select(DZ_CODE, UR6FOLD) |>
  mutate(ruc = case_when(
    UR6FOLD <= 4 ~ "Urban",
    UR6FOLD >= 5 ~ "Rural"
  )) |>
  mutate(classification = case_when(
    UR6FOLD %in% c(1) ~ "Large urban areas",
    UR6FOLD %in% c(2) ~ "Other urban areas",
    UR6FOLD %in% c(3, 4) ~ "Small towns",
    UR6FOLD %in% c(5, 6) ~ "Rural areas"
  ))

ruc_dz <-
  ruc_dz |>
  select(
    dz11_code = DZ_CODE,
    ruc16_code = UR6FOLD,
    ruc,
    classification
  )

# Rename
ruc16_dz11 <- ruc_dz

# Save output to data/ folder
usethis::use_data(ruc16_dz11, overwrite = TRUE)
