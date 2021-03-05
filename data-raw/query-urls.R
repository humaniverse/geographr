# ---- Load libraries ----
library(tibble)

# ---- Build data ----
# ONS geoportal query urls can be found on the "API Explorer" tab.
query_urls <-
  tribble(
    ~data_set, ~type, ~notes, ~query_url, ~source,
    "ccg", "boundaries", "April 2020 - Ultra generalised", "https://ons-inspire.esriuk.com/arcgis/rest/services/Health_Boundaries/Clinical_Commissioning_Groups_April_2020_EN_BUC/MapServer/1/query?where=1%3D1&outFields=*&outSR=4326&f=json", "https://geoportal.statistics.gov.uk/datasets/clinical-commissioning-groups-april-2020-ultra-generalised-boundaries-en?geometry=-41.190%2C48.021%2C36.901%2C57.304",
    "counties_ua", "boundaries", "December 2019 - Ultra generalised", "https://ons-inspire.esriuk.com/arcgis/rest/services/Administrative_Boundaries/Counties_and_Unitary_Authorities_December_2019_Boundaries_UK_BUC2/MapServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json", "https://geoportal.statistics.gov.uk/datasets/counties-and-unitary-authorities-december-2019-boundaries-uk-buc?geometry=-39.482%2C47.293%2C38.609%2C56.716",
    "lad", "boundaries", "December 2019 - Ultra generalised", "https://ons-inspire.esriuk.com/arcgis/rest/services/Administrative_Boundaries/Local_Authority_Districts_December_2019_Boundaries_UK_BUC/MapServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json", "https://geoportal.statistics.gov.uk/datasets/local-authority-districts-december-2019-boundaries-uk-buc",
    "msoa", "boundaries", "December 2011 - Full resolution - clipped to the coastline (Mean High Water mark)", "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/Middle_Layer_Super_Output_Areas_December_2011_EW_BFC_V2/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json", "https://geoportal.statistics.gov.uk/datasets/middle-layer-super-output-areas-december-2011-boundaries-full-clipped-bfc-ew-v3?geometry=-41.548%2C48.013%2C37.202%2C57.298",
    "stp", "boundaries", "April 2020 - Ultra generalised", "https://ons-inspire.esriuk.com/arcgis/rest/services/Health_Boundaries/Sustainability_and_Transformation_Partnerships_April_2020_Boundaries_EN_BUC/MapServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json", "https://geoportal.statistics.gov.uk/datasets/sustainability-and-transformation-partnerships-april-2020-boundaries-en-buc?geometry=-41.520%2C48.021%2C37.230%2C57.304",
    "towns_cities", "boundaries", "December 2015 - Generalised Grid (50m) - clipped to the coastline (Mean High Water mark)", "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/Major_Towns_and_Cities_December_2015_EW_BGG/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json", "https://geoportal.statistics.gov.uk/datasets/major-towns-and-cities-december-2015-boundaries",
    "wards", "boundaries", "December 2020 - Super generalised (200m) - clipped to the coastline (Mean High Water mark)", "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/Wards_December_2020_UK_BSC_V2/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json", "https://geoportal.statistics.gov.uk/datasets/wards-december-2020-uk-bsc-v2",
    "nhs_trusts", "points", "Addresses of NHS Trusts to geocode", "https://files.digital.nhs.uk/assets/ods/current/etr.zip", "https://digital.nhs.uk/services/organisation-data-service/data-downloads/other-nhs-organisations",
    "msoa_lad", "lookup", "Middle Layer Super Output Area (2011) to Ward to LAD (December 2019)", "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/MSOA11_WD19_LAD19_EW_LU/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json", "https://geoportal.statistics.gov.uk/datasets/0b3c76d1eb5e4ffd98a3679ab8dea605_0/geoservice",
    "ccg_stp", "lookup", "Clinical Commissioning Group to STPs (April 2020) Lookup in England", "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/CCG20_STP20_EN_LU/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json", "https://geoportal.statistics.gov.uk/datasets/clinical-commissioning-group-to-stps-april-2020-lookup-in-england/geoservice"
  )

usethis::use_data(query_urls, internal = TRUE, overwrite = TRUE)
