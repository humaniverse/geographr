# ---- Load ----
library(tidyverse)
library(devtools)
library(httr)
library(readxl)

# Load package
load_all(".")

# ---- Load catchment population data ----
# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "trust_msoa") %>%
  pull(query_url)

# Make GET request
GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

# All admissions
catchment_populations <-
  read_excel("c:/users/040026704/Downloads/2021 Trust Catchment Populations_Supplementary MSOA Analysis.xlsx", sheet = "All Admissions")

# Keep only the proportions and lookup codes
catchment_proportions <-
  catchment_populations %>%
  filter(CatchmentYear == 2019) %>%
  select(
    msoa_code = msoa,
    trust_code = TrustCode,
    proportion
  )

# Note that some MSOA's only have 90% patient coverage (i.e., 10% were not
# attributed to any Trust within an MSOA):
# catchment_proportions %>%
#   group_by(msoa_code) %>%
#   summarise(total = sum(proportion)) %>%
#   arrange(total)

# ---- Update trusts ----
# Source: https://digital.nhs.uk/services/organisation-data-service/file-downloads/miscellaneous
# The "Successor Organisation" and "Archived Successor Organisations" document
# Trust changes. The former covering the past financial year, and the latter all
# historic changes before that.

# Load successor data
GET(
  "https://files.digital.nhs.uk/assets/ods/current/succ.zip",
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())

successor_raw <-
  read_csv(
    list.files(tempdir(),
      pattern = "succ.csv",
      full.names = TRUE
    ),
    col_names = c(
      "old_code",
      "new_code",
      "R",
      "date",
      "blank"
    )
  )

successor <-
  successor_raw %>%
  select(
    old_code,
    new_code
  )

# Load Archived Successor Organisations
GET(
  "https://files.digital.nhs.uk/assets/ods/current/succarc.zip",
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())

successor_archived_raw <-
  read_csv(
    list.files(tempdir(),
      pattern = "succarc.csv",
      full.names = TRUE
    ),
    col_names = c(
      "old_code",
      "new_code",
      "R",
      "date",
      "blank"
    )
  )

successor_archived <-
  successor_archived_raw %>%
  select(
    old_code,
    new_code
  )

# Join all trust changes (note the data also contains non trusts)
trust_changes <-
  bind_rows(
    successor,
    successor_archived
  )

# Update old trusts in catchment_proportions
catchment_proportions_updated_trusts <-
  catchment_proportions %>%
  left_join(
    trust_changes,
    by = c("trust_code" = "old_code")
  ) %>%
  mutate(
    trust_code = if_else(
      is.na(new_code),
      trust_code,
      new_code
    )
  ) %>%
  select(-new_code) %>%
  relocate(trust_code)

# Some Trust codes are repeated (e.g., "RAJ") as old trusts merge to the same
# new or existing Trust. In these instances, the proportions need to be summed.
catchment_proportions_summed <-
  catchment_proportions_updated_trusts |>
  group_by(msoa_code, trust_code) |>
  summarise(proportion = sum(proportion)) |>
  ungroup()

lookup_trust_msoa <- catchment_proportions_summed

# Save output to data/ folder
usethis::use_data(lookup_trust_msoa, overwrite = TRUE)
