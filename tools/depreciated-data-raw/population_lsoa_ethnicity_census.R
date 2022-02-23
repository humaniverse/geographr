library(tidyverse)
library(devtools)
library(lobstr)
library(nomisr)

# Census ethnicity data from table KS201EW: Ethnic Group
# https://www.nomisweb.co.uk/census/2011/ks201ew
#
# Nomis API URL: https://www.nomisweb.co.uk/api/v01/dataset/NM_608_1.jsonstat.json?date=latest&geography=&rural_urban=0,100,101&cell=0,100,1...4,200,5...8,300,9...13,400,14...16,500,17,18&measures=20301
census_raw <-
  nomis_get_data(
    id = "NM_608_1",
    date = "latest",
    geography = "TYPE298",  # LSOA

    rural_urban = "0,100,101",  # total urban and total rural, plus overall total
    cell = "0,100,1...4,200,5...8,300,9...13,400,14...16,500,17,18",  # all ethnic group categories

    # measures = "20301",  # percentages
    measure = "20100",   # values


    # variables to keep
    select = c(
      "GEOGRAPHY_CODE",
      "MEASURES_NAME",
      "RURAL_URBAN_NAME",
      "CELL_NAME",
      "OBS_VALUE"
    )
  )

# Get top-line ethnic group categories
population_lsoa_ethnicity_census <-
  census_raw |>
  filter(RURAL_URBAN_NAME == "Total") |>
  select(lsoa_code = GEOGRAPHY_CODE, ethnicity = CELL_NAME, n_people = OBS_VALUE) |>
  filter(
    ethnicity %in% c(
      "White", "Asian/Asian British", "Black/African/Caribbean/Black British",
      "Mixed/multiple ethnic groups", "Other ethnic group"
    )
  )

# Get detailed ethnic group categories
population_lsoa_ethnicity_census_detailed <-
  census_raw |>
  filter(RURAL_URBAN_NAME == "Total") |>
  select(lsoa_code = GEOGRAPHY_CODE, ethnicity = CELL_NAME, n_people = OBS_VALUE) |>
  filter(
    !ethnicity %in% c(
      "All usual residents", "White", "Asian/Asian British", "Black/African/Caribbean/Black British",
      "Mixed/multiple ethnic groups", "Other ethnic group"
    )
  )

# Check object is below 50Mb GitHub warning limit
if (obj_size(population_lsoa_ethnicity_census) > 50000000) {
  stop("File is too large")
}

if (obj_size(population_lsoa_ethnicity_census_detailed) > 50000000) {
  stop("File is too large")
}

# Save output to data/ folder
usethis::use_data(population_lsoa_ethnicity_census, overwrite = TRUE)
usethis::use_data(population_lsoa_ethnicity_census_detailed, overwrite = TRUE)
