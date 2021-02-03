# ---- Load libraries ----
library(tidyverse)
library(readxl)
library(httr)
library(sf)

# ---- Build Primary Care Network boundaries ----
# - license -
# All the publicly accessible NHS Digital data is available under the Open
# Government License: https://digital.nhs.uk/services/supporting-open-data-and-transparency

# PCNs don't have boundaries, but we can build them from the boundaries of their
# member GPs
# Load GP submitted inner catchment areas - Jan-Mar 2020
# Source: https://digital.nhs.uk/data-and-information/data-collections-and-data-sets/data-collections/general-practice-data-collections
gp_shp <- read_sf("https://files.digital.nhs.uk/assets/eDEC/eDecJan-Mar2020.kml")

# Some GPs have more than one polygon - merge them
gp_shp <-
  gp_shp %>%
  group_by(Name) %>%
  summarise()

# Split `Name` column into Codes and Names
gp_shp <-
  gp_shp %>%
  separate(Name, c("Code", "Name"), sep = " - ")

# Load GP to PCN lookup
# Source: `epcn` file from https://digital.nhs.uk/services/organisation-data-service/data-downloads/gp-and-gp-practice-related-data
GET(
  "https://digital.nhs.uk/binaries/content/assets/website-assets/services/ods/data-downloads-other-nhs-organisations/epcn.zip",
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())
unlink(tf)
rm(tf)

gp_pcn <-
  read_excel(
    paste0(tempdir(), "/ePCN.xlsx"),
    sheet = "PCN Core Partner Details"
  )

# Select and rename vars
gp_pcn <-
  gp_pcn %>%
  select(
    gp_code = `Partner\r\nOrganisation\r\nCode`,
    gp_name = `Partner\r\nName`,
    pcn_code = `PCN Code`,
    pcn_name = `PCN Name`
  )

# Join GP shapefile to PCN's
pcn_shp_all <-
  gp_shp %>%
  left_join(gp_pcn, by = c("Code" = "gp_code")) %>%
  filter(!is.na(pcn_code))

# Create union in overlapping GP areas
pcn <-
  pcn_shp_all %>%
  group_by(pcn_code, pcn_name) %>%
  summarise()

# Save output to data/ folder
usethis::use_data(pcn, overwrite = TRUE)
