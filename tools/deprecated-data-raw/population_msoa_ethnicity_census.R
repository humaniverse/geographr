library(tidyverse)
library(nomisr)

# Census ethnicity data from table KS201EW: Ethnic Group
# https://www.nomisweb.co.uk/census/2011/ks201ew
#
# Nomis API URL: https://www.nomisweb.co.uk/api/v01/dataset/NM_608_1.jsonstat.json?date=latest&geography=&rural_urban=0,100,101&cell=0,100,1...4,200,5...8,300,9...13,400,14...16,500,17,18&measures=20301
census_raw <-
  nomis_get_data(
    id = "NM_608_1",
    date = "latest",
    geography = "TYPE297",  # MSOA

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
