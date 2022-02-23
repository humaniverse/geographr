# ---- Load ----
library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# LAD lookup
lookup <-
  lookup_postcode_lad |>
  distinct(lad_name, lad_code)

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "pop_lad") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xls"))
)

pop_lad <-
  read_excel(
    tf,
    sheet = "MYE2 - Persons",
    skip = 4
  )

# Keep only valid 2020 LAD codes for England, Scotland, and Wales
pop_lad_eng_sco_wal <-
  pop_lad |>
  rename(lad_code = Code) |>
  right_join(lookup, by = "lad_code") |>
  relocate(lad_name, .after = lad_code) |>
  select(-Name, -Geography1) |>
  rename(total_population = `All ages`)

# Keep valid 2020 LAD codes for NI
pop_lad_ni <-
  pop_lad |>
  rename(lad_code = Code, lad_name = Name) |>
  filter(str_detect(lad_code, "^N09")) |>
  select(-Geography1) |>
  rename(total_population = `All ages`)

# bind rows
pop_lad <-
  bind_rows(
    pop_lad_eng_sco_wal,
    pop_lad_ni
  )

# Rename
population_lad <- pop_lad

# Save output to data/ folder
usethis::use_data(population_lad, overwrite = TRUE)