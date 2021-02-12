# ---- Load ----
library(tidyverse)
library(sf)
library(lobstr)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls %>%
  filter(data_set == "towns_cities") %>%
  pull(query_url)

towns_cities <-
  read_sf(query_url) %>%
  st_transform(crs = 4326)

# Select and rename vars
towns_cities <-
  towns_cities %>%
  select(
    town_city_name = TCITY15NM,
    town_city_code = TCITY15CD,
    geometry
  )

# Make sure geometries are valid
towns_cities <- st_make_valid(towns_cities)

# Check geometry types are homogenous
if(towns_cities %>%
   st_geometry_type() %>%
   unique() %>%
   length() > 1){
  stop("Incorrect geometry types")
}

if(towns_cities %>% st_geometry_type() %>% unique() != "MULTIPOLYGON"){
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if(obj_size(towns_cities) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_towns_cities <- towns_cities

# Save output to data/ folder
usethis::use_data(boundaries_towns_cities, overwrite = TRUE)
