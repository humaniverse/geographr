# ---- Load ----
library(tidyverse)
library(sf)
library(lobstr)
library(devtools)

# Load package
load_all(".")

lgd <-
  boundaries_ltla24 |>
  filter(str_starts(ltla24_code, "N"))

# Create LGD - EPG lookup
# Source: P.22 for map https://www.executiveoffice-ni.gov.uk/sites/default/files/publications/ofmdfm_dev/The%20Northern%20Ireland%20Civil%20Contingencies%20Framework%20%28Revised%202023%29.pdf
lookup <- tibble(
  ltla24_code = c(
    "N09000001", "N09000002", "N09000003", "N09000004", "N09000005",
    "N09000006", "N09000007", "N09000008", "N09000009", "N09000010",
    "N09000011"
  ),
  epg04_name = c(
    "North", "South", "Belfast", "North", "North", "South", "South",
    "North", "South", "South", "South"
  )
)

# Dissolve LGDs to create EPG groupings
epg <- lgd |>
  left_join(lookup) |>
  group_by(epg04_name) |>
  summarise(geometry = st_union(geometry))

# Make sure geometries are valid
epg <- st_make_valid(epg)

# Check geometry types are homogenous
if (epg |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (epg |>
  st_geometry_type() |>
  unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(epg) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_epg04 <- epg

# Save output to data/ folder
usethis::use_data(boundaries_epg04, overwrite = TRUE)
