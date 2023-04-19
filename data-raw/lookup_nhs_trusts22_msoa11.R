library(tidyverse)
library(httr)
library(devtools)
library(readxl)

load_all(".")

query_url <-
  query_urls |>
  filter(id == "nhs_trust22_msoa11") |>
  pull(query)

GET(
  query_url,
  write_disk(raw <- tempfile(fileext = ".xlsx"))
)

# ---- Explanation of variables in catchment_populations ----
# - patients = number of patients from an msoa that went to the listed trust
# - total_patients = total number of patients from the listed msoa (e.g., try
#   filter the dataset to just one msoa in one year)
# - proportion = the ratio of patients to total_patients (e.g., the percentage
#   of patients from the listed msoa that went to the listed trust)
# - msoa_total_catchment = the proportion multiplied by the total population of
#   the msoa (note the population is listed in another dataset). i.e., this is
#   the number of people from an msoa that can be expected to attend the listed
#   trust.
# - trust_total_catchment = the number of people from all msoa's that can be
#   expected to attend the listed trust.
catchment_populations <-
  read_excel(
    raw,
    sheet = "All Admissions"
  )

catchment_populations_renamed <-
  catchment_populations |>
  select(
    msoa11_code = msoa,
    nhs_trust22_code = TrustCode,
    catchment_year = CatchmentYear,
    trust_total_catchment,
    proportion_msoa_went_to_trust = proportion,
    msoa_total_catchment
  )

lookup_nhs_trusts22_msoa11 <-
  catchment_populations_renamed |>
  mutate(proportion_trust_came_from_msoa = msoa_total_catchment / trust_total_catchment) |>
  select(
    msoa11_code,
    nhs_trust22_code,
    proportion_msoa_went_to_trust,
    proportion_trust_came_from_msoa
  )

usethis::use_data(lookup_nhs_trusts22_msoa11, overwrite = TRUE)

# ---- LTLA lookup ----
lookup_nhs_trusts22_ltla21 <-
  catchment_populations_renamed |>
  left_join(lookup_msoa11_ltla21) |>
  select(-ends_with("name"), -msoa11_code) |>
  relocate(ltla21_code) |>
  group_by(nhs_trust22_code, ltla21_code) |>
  summarise(ltla_total_catchment = sum(msoa_total_catchment)) |>
  mutate(trust_total_catchment = sum(ltla_total_catchment)) |>
  mutate(proportion_trust_came_from_ltla = ltla_total_catchment / trust_total_catchment) |>
  ungroup() |>
  select(nhs_trust22_code, ltla21_code, proportion_trust_came_from_ltla)

usethis::use_data(lookup_nhs_trusts22_ltla21, overwrite = TRUE)

# ---- ICB lookup ----
# Create MSOA to ICB lookup
msoa_icb <- lookup_lsoa11_sicbl22_icb22_ltla22 |>
  left_join(lookup_lsoa11_msoa11) |>
  distinct(msoa11_code, icb22_code)

# Note: MSOAs are not perfectly coterminous with ICBs, with 9 MSOAs overlapping
# across two different ICB's. This is 0.1 % of all MSOAs (9/8480 * 100)
msoa_icb |>
  count(msoa11_code) |>
  filter(n > 1)

# Save list of non-coterminous MSOAs
non_coterminous_msoas <- msoa_icb |>
  count(msoa11_code) |>
  filter(n > 1) |>
  pull(msoa11_code)

# Assume populations in non coterminous MSOAs are split equally between the
# two ICBs
split_msoa_catchments <- catchment_populations_renamed |>
  left_join(msoa_icb) |>
  select(nhs_trust22_code, icb22_code, msoa11_code, msoa_total_catchment) |>
  mutate(
    msoa_total_catchment = if_else(
      msoa11_code %in% non_coterminous_msoas,
      msoa_total_catchment / 2,
      msoa_total_catchment
    )
  )

lookup_nhs_trusts22_icb22 <- split_msoa_catchments |>
  group_by(nhs_trust22_code, icb22_code) |>
  summarise(icb_total_catchment = sum(msoa_total_catchment)) |>
  mutate(trust_total_catchment = sum(icb_total_catchment)) |>
  mutate(proportion_trust_came_from_icb = icb_total_catchment / trust_total_catchment) |>
  ungroup() |>
  select(nhs_trust22_code, icb22_code, proportion_trust_came_from_icb)

# Notes about above intermediate variables:
# - icb_total_catchment = the number of people from an msoa that can be expected
#   to attend the listed trust
# - trust_total_catchment = The number of people from all ICBs that can be
#   expected to attend the listed trust.

usethis::use_data(lookup_nhs_trusts22_icb22, overwrite = TRUE)
