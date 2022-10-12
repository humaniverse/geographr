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
    count_patients_from_msoa_to_trust = msoa_total_catchment
  )

lookup_nhs_trusts22_msoa11 <-
  catchment_populations_renamed |>
  mutate(proportion_trust_came_from_msoa = count_patients_from_msoa_to_trust / trust_total_catchment) |>
  select(
    msoa11_code,
    nhs_trust22_code,
    proportion_msoa_went_to_trust,
    proportion_trust_came_from_msoa
  )

usethis::use_data(lookup_nhs_trusts22_msoa11, overwrite = TRUE)
