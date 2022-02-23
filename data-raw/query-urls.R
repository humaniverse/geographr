# ---- Load libraries ----
library(tibble)

# ---- Build data ----
# ONS geoportal query urls can be found on the "API Explorer" tab.
query_urls <-
  tribble(

    # Column Names
    ~geog_type, ~id, ~date, ~license, ~query, ~source,

    # Boundaries
    "boundaries", "ccg_21", "01.04.21", "OGLv3", "https://opendata.arcgis.com/datasets/d6acd30ad71f4e14b4de808e58d9bc4c_0.geojson", "https://geoportal.statistics.gov.uk/datasets/clinical-commissioning-groups-april-2021-en-buc/explore?location=51.835875%2C-2.452657%2C6.00",
    "boundaries", "counties_ua_19", "01.12.19", "OGLv3", "https://opendata.arcgis.com/datasets/b216b4c8a4e74f6fb692a1785255d777_0.geojson", "https://geoportal.statistics.gov.uk/datasets/counties-and-unitary-authorities-december-2019-boundaries-uk-buc/explore?location=54.155480%2C-3.250000%2C6.00",
    "boundaries", "counties_ua_21", "01.04.21", "OGLv3", "https://opendata.arcgis.com/datasets/69109c4fbbc54f1f9d6e18000031a5fd_0.geojson", "https://geoportal.statistics.gov.uk/datasets/counties-and-unitary-authorities-may-2021-uk-buc/explore?location=55.340122%2C-3.316413%2C6.22",
    "boundaries", "countries_20", "01.12.20", "OGLv3", "https://opendata.arcgis.com/datasets/bb7104d3a9c04937be57e408288282dc_0.geojson", "https://geoportal.statistics.gov.uk/datasets/countries-december-2020-uk-buc/explore?location=54.650000C-3.250000%2C6.04",
    "boundaries", "dz_11", "01.01.11", "OGLv3", "https://maps.gov.scot/ATOM/shapefiles/SG_DataZoneBdry_2011.zip", "https://spatialdata.gov.scot/geonetwork/srv/eng/catalog.search#/metadata/7d3e8709-98fa-4d71-867c-d5c8293823f2",
    "boundaries", "hb_19", "01.01.19", "OGLv3", "https://maps.gov.scot/ATOM/shapefiles/SG_NHS_HealthBoards_2019.zip", "https://spatialdata.gov.scot/geonetwork/srv/eng/catalog.search;jsessionid=2BA249588D00C49F254018A42F2C6958#/metadata/f12c3826-4b4b-40e6-bf4f-77b9ed01dc14",
    "boundaries", "iz_11", "01.01.11", "OGLv3", "https://maps.gov.scot/ATOM/shapefiles/SG_IntermediateZoneBdry_2011.zip", "https://spatialdata.gov.scot/geonetwork/srv/eng/catalog.search#/metadata/389787c0-697d-4824-9ca9-9ce8cb79d6f5",
    "boundaries", "lad_19", "01.12.19", "OGLv3", "https://opendata.arcgis.com/datasets/3a4fa2ce68f642e399b4de07643eeed3_0.geojson", "https://geoportal.statistics.gov.uk/datasets/local-authority-districts-december-2019-boundaries-uk-buc/explore?location=55.340150%2C-3.316300%2C6.22",
    "boundaries", "lad_21", "01.12.21", "OGLv3", "https://opendata.arcgis.com/datasets/ac4ad96a586b4e4bab306dd59eb09401_0.geojson", "https://geoportal.statistics.gov.uk/datasets/local-authority-districts-december-2021-uk-buc/explore?location=57.654858%2C-11.079503%2C13.82",
    "boundaries", "lhb_20", "01.04.20", "OGLv3", "https://opendata.arcgis.com/datasets/ed5dccae76204a0ea411fcbbe1132659_0.geojson", "https://geoportal.statistics.gov.uk/datasets/local-health-boards-april-2020-wa-buc/explore?location=52.383842%2C-4.058123%2C8.70",
    "boundaries", "lsoa_11", "01.12.11", "OGLv3", "https://opendata.arcgis.com/datasets/e9d10c36ebed4ff3865c4389c2c98827_0.geojson", "https://geoportal.statistics.gov.uk/datasets/lower-layer-super-output-areas-december-2011-boundaries-super-generalised-clipped-bsc-ew-v3/explore?location=52.837570%2C-2.489798%2C7.20",
    "boundaries", "msoa_11", "01.12.11", "OGLv3", "https://opendata.arcgis.com/datasets/80223f1d571c405fb2fdf719c7e6da13_0.geojson", "https://geoportal.statistics.gov.uk/datasets/middle-layer-super-output-areas-december-2011-boundaries-super-generalised-clipped-bsc-ew-v3/explore?location=52.846044%2C-2.465779%2C7.21",
    "boundaries", "pfa_20", "01.12.20", "OGLv3", "https://opendata.arcgis.com/datasets/2a1e3c23f1f24f15808275f52b8ae20d_0.geojson", "https://geoportal.statistics.gov.uk/datasets/police-force-areas-december-2020-ew-buc/explore?location=52.846527%2C-2.452657%2C7.21",
    "boundaries", "soa_11", "01.01.11", "OGLv3", "https://www.nisra.gov.uk/sites/nisra.gov.uk/files/publications/SOA2011_Esri_Shapefile_0.zip", "https://www.nisra.gov.uk/publications/super-output-area-boundaries-gis-format",
    "boundaries", "stp_21", "01.04.21", "OGLv3", "https://opendata.arcgis.com/datasets/7ee99c1d8ef4424bab4b933a5dbe6aca_0.geojson", "https://geoportal.statistics.gov.uk/datasets/sustainability-and-transformation-partnerships-april-2021-en-buc/explore?location=52.846526%2C-2.452657%2C7.21",
    "boundaries", "trusts_ni_18", "21.03.18", "OGLv3", "https://www.opendatani.gov.uk/dataset/0b04b46c-49af-45d5-b277-91b10937a01b/resource/7fa52dde-90b8-446e-bb79-4871d1028cb4/download/dohtrustboundary.zip", "https://www.opendatani.gov.uk/dataset/department-of-health-trust-boundaries/resource/7fa52dde-90b8-446e-bb79-4871d1028cb4",
    "boundaries", "wards_21", "01.12.21", "OGLV3", "https://opendata.arcgis.com/datasets/bf9d32b1aa9941af84e6c2bf0c54b1bb_0.geojson", "https://geoportal.statistics.gov.uk/datasets/wards-december-2021-uk-bsc/explore",

    # Points
    "points", "nhs_trusts_22", "23.04.2022", "OGLv3", "https://files.digital.nhs.uk/assets/ods/current/etr.zip", "https://digital.nhs.uk/services/organisation-data-service/file-downloads/other-nhs-organisations",

    # Lookups

    # Rural-Urban Classifications
    "ruc", "ruc_lsoa_11", "01.01.11", "OGLv3", "https://opendata.arcgis.com/datasets/276d973d30134c339eaecfc3c49770b3_0.geojson", "https://geoportal.statistics.gov.uk/datasets/rural-urban-classification-2011-of-lower-layer-super-output-areas-in-england-and-wales/explore",
    "ruc", "ruc_msoa_11", "01.01.11", "OGLv3", "https://opendata.arcgis.com/datasets/0af77205a4644af3af2175d21a4ef4db_0.geojson", "https://geoportal.statistics.gov.uk/datasets/rural-urban-classification-2011-of-middle-layer-super-output-areas-in-england-and-wales/explore",
    "ruc", "ruc_wards_11", "01.01.11", "OGLv3", "https://opendata.arcgis.com/datasets/21bb76b77a144ee081e8d846b888962f_0.geojson", "https://geoportal.statistics.gov.uk/datasets/rural-urban-classification-2011-of-wards-in-england-and-wales/explore",
    "ruc", "ruc_dz_11", "01.01.16", "OGLv3", "https://www.gov.scot/binaries/content/documents/govscot/publications/advice-and-guidance/2018/03/scottish-government-urban-rural-classification-2016/documents/scottish-government-urban-rural-classification-2016-data-zone-lookup/scottish-government-urban-rural-classification-2016-data-zone-lookup/govscot%3Adocument/00544928.csv", "https://www.gov.scot/publications/scottish-government-urban-rural-classification-2016/pages/2/"
  )

usethis::use_data(query_urls, internal = TRUE, overwrite = TRUE)