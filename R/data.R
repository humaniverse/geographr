#' Clinical Commissioning Groups (April 2021)
#'
#' A data set containing 2021 Clinical Commissioning Group (CCG) geometries and
#' their associated names and codes. Boundaries are ultra generalised (500m).
#'
#' @format A data frame of class "sf" with 106 rows and 3 variables:
#' \describe{
#'   \item{ccg_21_name}{CCG name}
#'   \item{ccg_21_code}{CCG code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_ccg_21"

#' Counties and Unitary Authorities (December 2019)
#'
#' A data set containing 2019 County and Unitary Authority (UA) geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 216 rows and 3 variables:
#' \describe{
#'   \item{county_ua_19_name}{county and UA name}
#'   \item{county_ua_19_code}{county and UA code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_counties_ua_19"

#' Counties and Unitary Authorities (May 2021)
#'
#' A data set containing 2021 County and Unitary Authority (UA) geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 217 rows and 3 variables:
#' \describe{
#'   \item{county_ua_21_name}{county and UA name}
#'   \item{county_ua_21_code}{county and UA code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_counties_ua_21"

#' Countries (December 2020)
#'
#' A data set containing 2020 Country geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 4 rows and 3 variables:
#' \describe{
#'   \item{country_20_name}{country name}
#'   \item{country_20_code}{Country code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_countries_20"

#' Data Zones (2011)
#'
#' A data set containing 2011 Scottish Data Zone geometries and their associated
#' names and codes.
#'
#' @format A data frame of class "sf" with 6,976 rows and 3 variables:
#' \describe{
#'   \item{dz_11_name}{Data Zone name}
#'   \item{dz_11_code}{Data Zone code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://spatialdata.gov.scot/}
"boundaries_dz_11"

#' Health Boards (2019)
#'
#' A data set containing 2019 NHS Health Board geometries and their associated
#' names and codes.
#'
#' @format A data frame of class "sf" with 14 rows and 3 variables:
#' \describe{
#'   \item{hb_19_name}{Health Board name}
#'   \item{hb_19_code}{Health Board code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://spatialdata.gov.scot/}
"boundaries_hb_19"

#' Intermediate Zones (2011)
#'
#' A data set containing 2011 Scottish Intermediate Zone geometries and their
#' associated names and codes.
#'
#' @format A data frame of class "sf" with 1,279 rows and 3 variables:
#' \describe{
#'   \item{iz_11_name}{Intermediate Zone name}
#'   \item{iz_11_code}{Intermediate Zone code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://spatialdata.gov.scot/}
"boundaries_iz_11"

#' Local Authority Districts (December 2019)
#'
#' A data set containing 2019 Local Authority Districts (LAD) geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 382 rows and 3 variables:
#' \describe{
#'   \item{lad_19_name}{LAD name}
#'   \item{lad_19_code}{LAD code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_lad_19"

#' Local Authority Districts (December 2021)
#'
#' A data set containing 2021 Local Authority Districts (LAD) geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 374 rows and 3 variables:
#' \describe{
#'   \item{lad_21_name}{LAD name}
#'   \item{lad_21_code}{LAD code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_lad_21"

#' Wales Local Health Boards (2020)
#'
#' A data set containing 2020 Local Health Board geometries for Wales and their
#' associated names and codes.
#'
#' @format A data frame of class "sf" with 7 rows and 3 variables:
#' \describe{
#'   \item{lhb_20_name}{Local Health Board name}
#'   \item{lhb_20_code}{Local Health Board code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_lhb_20"

#' Lower Layer Super Output Areas (2011)
#'
#' A data set containing 2011 Lower Super Output Area (LSOA) geometries and
#' their associated names and codes. Full clipped boundaries were simplified
#' using the Visvalingam algorithm set to a weighting of 0.7 with a retaining
#' proportion of 0.05 points.
#'
#' @format A data frame of class "sf" with 34,076 rows and 3 variables:
#' \describe{
#'   \item{lsoa_11_name}{LSOA name}
#'   \item{lsoa_11_code}{LSOA code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_lsoa_11"

#' Middle Layer Super Output Areas (2011)
#'
#' A data set containing 2011 Middle Super Output Area (MSOA) geometries and
#' their associated names and codes. Super generalised (200m) boundaries were
#' simplified using the Visvalingam algorithm set to a weighting of 0.7 with a
#' retaining proportion of 0.05 points.
#'
#' @format A data frame of class "sf" with 7,083 rows and 3 variables:
#' \describe{
#'   \item{msoa_11_name}{MSOA name}
#'   \item{msoa_11_code}{MSOA code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_msoa_11"

#' Police Force Areas (2020)
#'
#' A data set containing 2020 Police Force Area geometries for England and Wales
#' and their associated names and codes.
#'
#' @format A data frame of class "sf" with 43 rows and 3 variables:
#' \describe{
#'   \item{pfa_20_name}{Police Force Area name}
#'   \item{pfa_20_code}{Police Force Area code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_pfa_20"

#' Super Output Areas (2011)
#'
#' A data set containing 2011 Northern Ireland Super Output Area geometries and
#' their associated names and codes as used following the 2011 Census results.
#'
#' @format A data frame of class "sf" with 890 rows and 3 variables:
#' \describe{
#'   \item{soa_11_name}{Super Output Area name}
#'   \item{soa_11_code}{Super Output Area code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://www.nisra.gov.uk/}
"boundaries_soa_11"

#' Sustainability and Transformation Partnerships (April 2021)
#'
#' A data set containing 2021 Sustainability and Transformation Partnerships
#' (STP) geometries and their associated names and codes. Boundaries are ultra
#' generalised (500m).
#'
#' @format A data frame of class "sf" with 42 rows and 3 variables:
#' \describe{
#'   \item{stp_21_name}{STP name}
#'   \item{stp_21_code}{STP code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_stp_21"

#' Northern Ireland Health and Social Care Trusts (2017)
#'
#' A data set containing 2017 Health and Social Care Trust geometries for
#' Northern Ireland and their associated names and codes.
#'
#' @format A data frame of class "sf" with 5 rows and 3 variables:
#' \describe{
#'   \item{trust_18_name}{Health and Social Care Trust name}
#'   \item{trust_18_code}{Health and Social Care Trust code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://www.opendatani.gov.uk/}
"boundaries_trusts_ni_18"

#' Wards / Electoral Divisions (December 2021)
#'
#' A data set containing 2021 Ward / Electoral Division geometries and their
#' associated names and codes. Boundaries are Super generalised (200m) - clipped
#' to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 8,694 rows and 3 variables:
#' \describe{
#'   \item{ward_21_name}{ward name}
#'   \item{ward_21_code}{ward code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_wards_21"

#' Local Authority Districts to Combined Authorities lookup (2020).
#'
#' A data set containing a lookup between December 2020 Local Authority
#' Districts and Combined Authorities (CAUTH).
#'
#' @format A data frame of class "tbl" with 53 rows and 4 variables:
#' \describe{
#'   \item{lad_20_name}{LAD name}
#'   \item{lad_20_code}{LAD code}
#'   \item{cauth_20_name}{County name}
#'   \item{cauth_20_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lad_cauth_20"

#' Local Authority Districts to County and Unitary Authorities lookup (2019).
#'
#' A data set containing a lookup between December 2019 Local Authority
#' Districts and County and Unitary Authorities.
#'
#' @format A data frame of class "tbl" with 339 rows and 4 variables:
#' \describe{
#'   \item{lad_19_name}{LAD name}
#'   \item{lad_19_code}{LAD code}
#'   \item{county_ua_19_name}{County name}
#'   \item{county_ua_19_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lad_counties_19"

#' Local Authority Districts to County and Unitary Authorities lookup (2020).
#'
#' A data set containing a lookup between December 2020 Local Authority
#' Districts and County and Unitary Authorities.
#'
#' @format A data frame of class "tbl" with 336 rows and 4 variables:
#' \describe{
#'   \item{lad_20_name}{LAD name}
#'   \item{lad_20_code}{LAD code}
#'   \item{county_ua_20_name}{County name}
#'   \item{county_ua_20_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lad_counties_20"

#' Local Authority Districts to County and Unitary Authorities lookup (2021).
#'
#' A data set containing a lookup between December 2021 Local Authority
#' Districts and County and Unitary Authorities.
#'
#' @format A data frame of class "tbl" with 331 rows and 4 variables:
#' \describe{
#'   \item{lad_21_name}{LAD name}
#'   \item{lad_21_code}{LAD code}
#'   \item{county_ua_21_name}{County name}
#'   \item{county_ua_21_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lad_counties_21"

#' Local Authority Districts to Fire and Rescue Authorities lookup (2021).
#'
#' A data set containing a lookup between April 2021 Local Authority
#' Fire and Rescue Authorities (FRA)
#'
#' @format A data frame of class "tbl" with 331 rows and 4 variables:
#' \describe{
#'   \item{lad_21_name}{LAD name}
#'   \item{lad_21_code}{LAD code}
#'   \item{fra_21_name}{FRA name}
#'   \item{fra_21_code}{FRA code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lad_fra_21"

#' Changes to England Local Authority codes over time (from 2019).
#'
#' A data set containing a lookup of the England Local Authority changes
#' between 2019, 2020 and 2021.
#'
#' @format A data frame of class "tbl" with 382 rows and 6 variables:
#' \describe{
#'   \item{lad_19_name}{2019 LAD name}
#'   \item{lad_19_code}{2019 LAD code}
#'   \item{lad_20_name}{2020 LAD name}
#'   \item{lad_20_code}{2020 LAD code}
#'   \item{lad_21_name}{2021 LAD name}
#'   \item{lad_21_code}{2021 LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/datasets/code-history-database-december-2021-for-the-united-kingdom/about}
"lookup_lad_lad"

#' Lower Layer Super Output Area (2011) to LAD (December 2021) Lookup
#'
#' A data set containing a lookup between 2011 Lower Super Output Areas (LSOA)
#' and 2021 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 34,753 rows and 4 variables:
#' \describe{
#'   \item{lsoa_11_name}{LSOA name}
#'   \item{lsoa_11_code}{LSOA code}
#'   \item{lad_21_name}{LAD name}
#'   \item{lad_21_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lsoa_lad_21"

#' Lower Layer Super Output Area (2011) to Middle Layer Super Output Area (2011) Lookup
#'
#' A data set containing a lookup between 2011 Lower (LSOA) and Middle Layer Super Output Areas (MSOA).
#'
#' @format A data frame of class "tbl" with 41,729 rows and 4 variables:
#' \describe{
#'   \item{lsoa_11_name}{LSOA name}
#'   \item{lsoa_11_code}{LSOA code}
#'   \item{msoa_11_name}{MSOA name}
#'   \item{msoa_11_code}{MSOA code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lsoa_msoa_11"

#' Middle Layer Super Output Area (2011) to LAD (December 2019) Lookup
#'
#' A data set containing a lookup between 2011 Middle Super Output Areas (MSOA)
#' and 2019 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa_11_name}{MSOA name}
#'   \item{msoa_11_code}{MSOA code}
#'   \item{lad_19_name}{LAD name}
#'   \item{lad_19_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_msoa_lad_19"

#' Middle Layer Super Output Area (2011) to LAD (December 2020) Lookup
#'
#' A data set containing a lookup between 2011 Middle Super Output Areas (MSOA)
#' and 2020 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa_11_name}{MSOA name}
#'   \item{msoa_11_code}{MSOA code}
#'   \item{lad_20_name}{LAD name}
#'   \item{lad_20_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_msoa_lad_20"

#' Middle Layer Super Output Area (2011) to LAD (December 2021) Lookup
#'
#' A data set containing a lookup between 2011 Middle Super Output Areas (MSOA)
#' and 2021 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa_11_name}{MSOA name}
#'   \item{msoa_11_code}{MSOA code}
#'   \item{lad_21_name}{LAD name}
#'   \item{lad_21_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_msoa_lad_21"

#' Postcode to Output Area (2011) to Lower Layer Super Output Area (2011) to
#'   Middle Layer Super Output Area (2011) to Local Authority District (2020)
#'   Lookup
#'
#' A data set containing a lookup between postcodes, OAs, LSOAs, MSOAs, and
#' 2020 Local Authority Districts, for England, Wales, and Scotland.
#'
#' @format A data frame of class "tbl" with 2,568,780 rows and 5 variables:
#' \describe{
#'   \item{postcode}{Postcodes}
#'   \item{oa_11_code}{OA code}
#'   \item{lsoa_11_code}{LSOA code}
#'   \item{msoa_11_code}{MSOA code}
#'   \item{lad_20_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_postcode_oa_lsoa_msoa_lad_20"
#' NHS Trusts (February 2022)
#'
#' A data set containing February 2022 NHS Trusts point geometries (i.e.,
#' lat/long coordinates) and their associated names, codes, and open status.
#'
#' @format A data frame of class "sf" with 218 rows and 4 variables:
#' \describe{
#'   \item{nhs_trust_22_name}{NHS Trust name}
#'   \item{nhs_trust_22_code}{NHS Trust code}
#'   \item{status}{whether the Trust is 'open' or 'closed'}
#'   \item{geometry}{point coordinates}
#'   ...
#' }
#' @source \url{https://digital.nhs.uk/}
"points_nhs_trusts_22"

#' Rural-Urban Classifications for Lower Layer Super Output Areas (2011) in
#' England and Wales
#'
#' A data set containing rural-urban classifications for LSOAs in England and
#' Wales.
#'
#' @format A data frame of class "tbl" with 34,753 rows and 4 variables:
#' \describe{
#'   \item{lsoa_11_code}{LSOA code}
#'   \item{ruc_11_code}{Rural-Urban Classification code}
#'   \item{RUC}{Whether the LSOA is classified as 'Rural' or 'Urban'}
#'   \item{Classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"ruc_lsoa_11"

#' Rural-Urban Classifications for Middle Layer Super Output Areas (2011) in
#' England and Wales
#'
#' A data set containing rural-urban classifications for MSOAs in England and
#' Wales.
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa_11_code}{MSOA code}
#'   \item{ruc_11_code}{Rural-Urban Classification code}
#'   \item{RUC}{Whether the MSOA is classified as 'Rural' or 'Urban'}
#'   \item{Classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"ruc_msoa_11"

#' Rural-Urban Classifications for wards (2011) in England and Wales
#'
#' A data set containing rural-urban classifications for wards in England and
#' Wales.
#'
#' @format A data frame of class "tbl" with 8,570 rows and 4 variables:
#' \describe{
#'   \item{ward_11_code}{Ward code}
#'   \item{ruc_11_code}{Rural-Urban Classification code}
#'   \item{RUC}{Whether the ward is classified as 'Rural' or 'Urban'}
#'   \item{Classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"ruc_wards_11"

#' Rural-Urban Classifications for Data Zones (2011) in Scotland
#'
#' A data set containing rural-urban classifications for Data Zones in Scotland.
#'
#' @format A data frame of class "tbl" with 6,976 rows and 4 variables:
#' \describe{
#'   \item{dz_11_code}{Data Zone code}
#'   \item{ruc_16_code}{Rural-Urban Classification code}
#'   \item{RUC}{Whether the DZ is classified as 'Rural' or 'Urban'}
#'   \item{Classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://www.gov.scot/}
"ruc_dz_11"

