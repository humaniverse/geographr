# ---- Load libraries ----
library(tibble)

# ---- Build data ----
# ONS geoportal query urls can be found on the "API Explorer" tab.
query_urls <-
  tribble(

    # Column Names
    ~geog_type, ~id, ~date, ~license, ~query, ~source,

    # Boundaries
    "boundaries", "countries_20", "01.12.20", "OGLv3", "https://opendata.arcgis.com/datasets/bb7104d3a9c04937be57e408288282dc_0.geojson", "https://geoportal.statistics.gov.uk/datasets/countries-december-2020-uk-buc/explore?location=54.650000C-3.250000%2C6.04",
    "ccg", "ccg_21", "01.04.21", "OGLv3", "https://opendata.arcgis.com/datasets/d6acd30ad71f4e14b4de808e58d9bc4c_0.geojson", "https://geoportal.statistics.gov.uk/datasets/clinical-commissioning-groups-april-2021-en-buc/explore?location=51.835875%2C-2.452657%2C6.00"

    # Points

    # Lookups

    # Rural-Urban Classifications
  )

usethis::use_data(query_urls, internal = TRUE, overwrite = TRUE)