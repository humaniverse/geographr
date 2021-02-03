# ---- Load libraries ----
library(tidyverse)
library(readxl)
library(httr)
library(sf)
library(janitor)

# ---- Build Primary Care Network boundaries ----
# PCNs don't have boundaries as such, but we can build them from the boundaries of their member GPs

# Load GP submitted inner catchment areas - Jan-Mar 2020
# Source: https://digital.nhs.uk/data-and-information/data-collections-and-data-sets/data-collections/general-practice-data-collections
gp_shp <- read_sf("https://files.digital.nhs.uk/assets/eDEC/eDecJan-Mar2020.kml")

# Some GPs have more than one polygon - merge them
gp_shp <-
  gp_shp %>%
  group_by(Name) %>%
  summarise() # https://gis.stackexchange.com/questions/307423/st-intersection-failing-for-overlapping-multipolygons-in-sf

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
  read_excel(paste0(tempdir(), "/ePCN.xlsx"), sheet = "PCN Core Partner Details")

gp_pcn <-
  gp_pcn %>%
  select(
    GP_Code = `Partner\r\nOrganisation\r\nCode`,
    GP_Name = `Partner\r\nName`,
    PCN_Code = `PCN Code`,
    PCN_Name = `PCN Name`
  )

pcn_shp_all <-
  gp_shp %>%
  left_join(gp_pcn, by = c("Code" = "GP_Code")) %>%
  filter(!is.na(PCN_Code))

pcn_shp <-
  pcn_shp_all %>%
  group_by(PCN_Code, PCN_Name) %>%
  summarise(do_union = FALSE)

write_sf(pcn_shp, "data/boundaries/Primary_Care_Networks.shp")
write_sf(pcn_shp, "data/boundaries/Primary_Care_Networks.geojson")

# TO DO:
# - Some parts of some MSOAs might be in multiple PCNs and a PCN contains multiple (parts of) MSOAs...
# - ... so calculate population-weighted vulnerability based on proportion of population in each PCN
#
# ---- Create lookup for MSOAs to PCNs based on centroids ----
# Middle Layer Super Output Areas (December 2011) Population Weighted Centroids
# Source: https://geoportal.statistics.gov.uk/datasets/middle-layer-super-output-areas-december-2011-population-weighted-centroids
msoa_centroids <- read_sf("https://opendata.arcgis.com/datasets/b0a6d8a3dc5d4718b3fd62c548d60f81_0.geojson") %>%
  st_transform(crs = 4326)

# Lookup the PCN each MSOA centroid is in
msoa_pcn <- msoa_centroids %>%
  st_join(pcn_shp) %>%
  st_drop_geometry() %>%
  select(MSOA11CD = msoa11cd, PCN_Code)

# Save lookup
write_csv(msoa_pcn, "data/lookup msoa to primary care network.csv")

# ---- Create lookup based on overlapping polygons ----
# Middle Layer Super Output Areas (December 2011) Boundaries EW BGC
# Source: https://geoportal.statistics.gov.uk/datasets/middle-layer-super-output-areas-december-2011-boundaries-ew-bgc
msoa_shp <- read_sf("https://opendata.arcgis.com/datasets/1e6f162967de4f3da92040761e8464d8_0.geojson") %>%
  st_transform(crs = 4326)

pcn_shp_tmp <- pcn_shp %>%
  arrange(PCN_Code) %>%
  mutate(PCN_ID = row_number()) %>%
  select(PCN_ID, PCN_Code) %>%
  arrange(PCN_ID)

msoa_shp_tmp <- msoa_shp %>%
  arrange(MSOA11CD) %>%
  mutate(MSOA_ID = row_number()) %>%
  select(MSOA_ID, MSOA11CD) %>%
  arrange(MSOA_ID)

pcn_msoa <- pcn_shp_tmp %>%
  st_intersects(msoa_shp_tmp, sparse = TRUE) %>%
  as.data.frame() %>%
  as_tibble()

pcn_msoa <- pcn_shp_tmp %>%
  st_join(msoa_shp_tmp) %>%
  st_drop_geometry()

write_csv(pcn_msoa, "data/lookup primary care network to msoas.csv")





usethis::use_data(DATASET, overwrite = TRUE)
