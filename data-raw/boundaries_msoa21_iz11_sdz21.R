# ---- Load ----
library(tidyverse)
library(sf)
library(rmapshaper)
library(lobstr)
library(devtools)

# Load package
load_all(".")

# Combine MSOA for the nations
boundaries_msoa_ni <- boundaries_sdz21 |>
  rename(msoa21_code = sdz21_code,
         msoa21_name = sdz21_name)

boundaries_msoa_scotland <- boundaries_iz11 |>
  rename(msoa21_code = iz11_code,
         msoa21_name = iz11_name)

boundaries_msoa_uk <- bind_rows(
  geographr::boundaries_msoa21, boundaries_msoa_ni,
  boundaries_msoa_scotland
)

# Simplify shape to reduce file size
# Set 'keep' argument to given level so keeps all MSOA rows
boundaries_msoa_uk <- ms_simplify(boundaries_msoa_uk,  keep = 0.55)

# Make sure geometries are valid
boundaries_msoa_uk <- st_make_valid(boundaries_msoa_uk)

# Check geometry types are homogenous
if (boundaries_msoa_uk |>
    st_geometry_type() |>
    unique() |>
    length() > 1) {
  stop("Incorrect geometry types")
}

if (boundaries_msoa_uk |>
    st_geometry_type() |>
    unique() != "MULTIPOLYGON") {
  stop("Incorrect geometry types")
}

# Check simplified shape is below 50Mb GitHub warning limit
if (obj_size(boundaries_msoa_uk) > 50000000) {
  stop("File is too large")
}

boundaries_msoa21_iz11_sdz21 <- boundaries_msoa_uk

# Save output to data/ folder
usethis::use_data(boundaries_msoa21_iz11_sdz21, overwrite = TRUE)

