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
    "boundaries", "ccg_21", "01.04.21", "OGLv3", "https://opendata.arcgis.com/datasets/d6acd30ad71f4e14b4de808e58d9bc4c_0.geojson", "https://geoportal.statistics.gov.uk/datasets/clinical-commissioning-groups-april-2021-en-buc/explore?location=51.835875%2C-2.452657%2C6.00",
    "boundaries", "counties_ua_19", "01.12.19", "OGLv3", "https://opendata.arcgis.com/datasets/b216b4c8a4e74f6fb692a1785255d777_0.geojson", "https://geoportal.statistics.gov.uk/datasets/counties-and-unitary-authorities-december-2019-boundaries-uk-buc/explore?location=54.155480%2C-3.250000%2C6.00",
    "boundaries", "counties_ua_21", "01.04.21", "OGLv3", "https://opendata.arcgis.com/datasets/69109c4fbbc54f1f9d6e18000031a5fd_0.geojson", "https://geoportal.statistics.gov.uk/datasets/counties-and-unitary-authorities-may-2021-uk-buc/explore?location=55.340122%2C-3.316413%2C6.22",
    "boundaries", "lad_19", "01.12.19", "OGLv3", "https://opendata.arcgis.com/datasets/3a4fa2ce68f642e399b4de07643eeed3_0.geojson", "https://geoportal.statistics.gov.uk/datasets/local-authority-districts-december-2019-boundaries-uk-buc/explore?location=55.340150%2C-3.316300%2C6.22",
    "boundaries", "lad_21", "01.12.21", "OGLv3", "https://opendata.arcgis.com/datasets/ac4ad96a586b4e4bab306dd59eb09401_0.geojson", "https://geoportal.statistics.gov.uk/datasets/local-authority-districts-december-2021-uk-buc/explore?location=57.654858%2C-11.079503%2C13.82",
    "boundaries", "lsoa_11", "01.12.21", "OGLv3", "https://opendata.arcgis.com/datasets/e9d10c36ebed4ff3865c4389c2c98827_0.geojson", "https://geoportal.statistics.gov.uk/datasets/lower-layer-super-output-areas-december-2011-boundaries-super-generalised-clipped-bsc-ew-v3/explore?location=52.837570%2C-2.489798%2C7.20"
    
    # Points

    # Lookups

    # Rural-Urban Classifications
  )

usethis::use_data(query_urls, internal = TRUE, overwrite = TRUE)
