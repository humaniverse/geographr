# Use this file to generate the data required
# Put the function that calls the lookup in R/lookup.R

# ---- Load libs ----
library(tidyverse)
library(httr)
library(readxl)

# ---- Load catchment population data ----
# Source: https://app.box.com/s/qh8gzpzeo1firv1ezfxx2e6c4tgtrudl
GET(
  "https://app.box.com/index.php?rm=box_download_shared_file&shared_name=qh8gzpzeo1firv1ezfxx2e6c4tgtrudl&file_id=f_646039228900",
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

# All admissions
catchment_populations_raw <-
  read_excel(tf, sheet = "All Admissions")

# Keep only the proportions and lookup codes
proportions <-
  catchment_populations_raw %>%
  filter(CatchmentYear == 2018) %>% 
  select(
    msoa_code = msoa,
    trust_code = TrustCode,
    proportion
  )

# Note that some MSOA's only have 90% patient coverage (i.e., 10% were not
# attributed to any Trust within an MSOA):
proportions %>% 
  group_by(msoa_code) %>% 
  summarise(total = sum(proportion)) %>% 
  arrange(total)

# TODO:
# 1. Extract URL link above into query-urls.R
# 2. Check Trusts are up-to-date, or aligned with NHS capacity Trust codes.
# 3. Export lookup table into R function that extracts away details:
#    lookup_trust_msoa(data = "data with trust codes + variable (e.g., bed occupancy"))
