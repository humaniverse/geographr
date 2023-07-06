library(tidyverse)
library(geographr)
library(sf)

# 11 Local Government Districts
lgd <-
  boundaries_ltla21 |>
  st_drop_geometry() |>
  filter(str_detect(ltla21_code, "^N"))

# LGDs and Health & Social Care Trusts are coterminous
# Source: Registrar General Annual Report 2015, Appendix 7
# https://www.nisra.gov.uk/sites/nisra.gov.uk/files/publications/Maps-of-NI-Health-Trusts-and-Local-Government-Districts.pdf

# Associate LGDs with HSCTs
belfast_trust <-
  c("Belfast")

northern_trust <-
  c("Causeway Coast and Glens", "Mid Ulster", "Mid and East Antrim", "Antrim and Newtownabbey")

south_eastern_trust <-
  c("Lisburn and Castlereagh", "Ards and North Down")

southern_trust <-
  c("Armagh City, Banbridge and Craigavon", "Newry, Mourne and Down")

western_trust <-
  c("Derry City and Strabane", "Fermanagh and Omagh")

# Create dataset
lookup_ltla21_hsct18 <- 
  lgd |>
  mutate(
    trust18_name = case_match(
      ltla21_name,
      belfast_trust ~ "Belfast",
      northern_trust ~ "Northern",
      south_eastern_trust ~ "South Eastern",
      southern_trust ~ "Southern",
      western_trust ~ "Western"
      ),
    trust18_code = case_match(
      ltla21_name,
      belfast_trust ~ "BHSCT",
      northern_trust ~ "NHSCT",
      south_eastern_trust ~ "SEHSCT",
      southern_trust ~ "SHSCT",
      western_trust ~ "WHSCT"
      ))

# Save output to data/ folder
usethis::use_data(lookup_ltla21_hsct18, overwrite = TRUE)