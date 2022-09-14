library(tidyverse)
library(devtools)

load_all()

# Load data for 2019 codes
lookup_ltla19_brc <- read_csv("data-raw/lookup-ltla19-brc_area.csv") |>
  rename(
    ltla19_code = LAD19CD,
    brc_area = TacticalCell
  )

# update to 2021 codes
lookup_ltla21_brc <-
  lookup_ltla19_brc |>
  left_join(
    lookup_ltla_ltla |> select(ltla19_code, ltla21_code)
  ) |>
  select(
    ltla21_code,
    brc_area
  )

# Save output to data/ folder
usethis::use_data(lookup_ltla19_brc, overwrite = TRUE)
usethis::use_data(lookup_ltla21_brc, overwrite = TRUE)
