# ---- Load libraries ----
library(tidyverse)
library(sf)

# ---- Load shapefile ----
# Middle Layer Super Output Areas (December 2011) Boundaries EW BFC V3
# source: https://geoportal.statistics.gov.uk/datasets/middle-layer-super-output-areas-december-2011-boundaries-full-clipped-bfc-ew-v3
msoa_2011 <-
  read_sf("https://opendata.arcgis.com/datasets/1382f390c22f4bed89ce11f2a9207ff0_0.kml?outSR=%7B%22latestWkid%22%3A27700%2C%22wkid%22%3A27700%7D") %>%
  st_transform(crs = 4326)

# Select and rename vars
msoa_2011 <-
  msoa_2011 %>%
  select(
    msoa_name = Name,
    msoa_code = Code,
    geometry
  )

# Save output to data/ folder
usethis::use_data(msoa_2011, overwrite = TRUE)
