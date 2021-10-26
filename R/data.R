#' Primary care networks
#'
#' A data set containing Primary Care Network (PCN) geometries calculated using
#' their member GP practices.
#'
#' @format A data frame of class "sf" with 1,278 rows and 3 variables:
#' \describe{
#'   \item{pcn_name}{PCN name}
#'   \item{pcn_code}{PCN code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://digital.nhs.uk/}
"boundaries_pcn"

#' Clinical Commissioning Groups (April 2020)
#'
#' A data set containing 2020 Clinical Commissioning Group (CCG) geometries and
#' their associated names and codes. Boundaries are ultra generalised (500m).
#'
#' @format A data frame of class "sf" with 135 rows and 3 variables:
#' \describe{
#'   \item{ccg_name}{CCG name}
#'   \item{ccg_code}{CCG code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_ccg"

#' Sustainability and Transformation Partnerships (April 2020)
#'
#' A data set containing 2020 Sustainability and Transformation Partnerships
#' (STP) geometries and their associated names and codes. Boundaries are ultra
#' generalised (500m).
#'
#' @format A data frame of class "sf" with 42 rows and 3 variables:
#' \describe{
#'   \item{stp_name}{STP name}
#'   \item{stp_code}{STP code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_stp"

#' Lower Layer Super Output Areas (2011)
#'
#' A data set containing 2011 Lower Super Output Area (LSOA) geometries and
#' their associated names and codes. Full clipped boundaries were simplified
#' using the Visvalingam algorithm set to a weighting of 0.7 with a retaining
#' proportion of 0.05 points.
#'
#' @format A data frame of class "sf" with 34,076 rows and 3 variables:
#' \describe{
#'   \item{lsoa_name}{LSOA name}
#'   \item{lsoa_code}{LSOA code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_lsoa"

#' Middle Layer Super Output Areas (2011)
#'
#' A data set containing 2011 Middle Super Output Area (MSOA) geometries and
#' their associated names and codes. Full clipped boundaries were simplified
#' using the Visvalingam algorithm set to a weighting of 0.7 with a retaining
#' proportion of 0.05 points.
#'
#' @format A data frame of class "sf" with 7,201 rows and 3 variables:
#' \describe{
#'   \item{msoa_name}{MSOA name}
#'   \item{msoa_code}{MSOA code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_msoa"

#' Local Authority Districts (December 2019)
#'
#' A data set containing 2019 Local Authority Districts (LAD) geometries and
#' their associated names and codes. Boundaries are ultra generalised (500m).
#'
#' @format A data frame of class "sf" with 382 rows and 3 variables:
#' \describe{
#'   \item{lad_name}{LAD name}
#'   \item{lad_code}{LAD code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_lad"

#' Wards / Electoral Divisions (December 2020)
#'
#' A data set containing 2020 Ward / Electoral Division geometries and their
#' associated names and codes. Boundaries are Super generalised (200m) - clipped
#' to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 8,887 rows and 3 variables:
#' \describe{
#'   \item{ward_name}{ward name}
#'   \item{ward_code}{ward code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_wards"

#' Major Towns and Cities (December 2015)
#'
#' A data set containing 2015 Major Town and City (December 2015) geometries
#' and their associated names and codes. Boundaries are Super generalised (200m)
#' - clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 112 rows and 3 variables:
#' \describe{
#'   \item{town_city_name}{town and city name}
#'   \item{town_city_code}{town and city code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_towns_cities"

#' Counties and Unitary Authorities (December 2019)
#'
#' A data set containing 2019 County and Unitary Authority (UA) geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 216 rows and 3 variables:
#' \describe{
#'   \item{county_ua_name}{county and UA name}
#'   \item{county_ua_code}{county and UA code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_counties_ua"

#' Countries (December 2020)
#'
#' A data set containing 2020 Country geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 4 rows and 3 variables:
#' \describe{
#'   \item{country_name}{country name}
#'   \item{country_code}{Country code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_countries"

#' Health Boards (2019)
#'
#' A data set containing 2019 NHS Health Board geometries and their associated
#' names and codes.
#'
#' @format A data frame of class "sf" with 14 rows and 3 variables:
#' \describe{
#'   \item{hb_name}{Health Board name}
#'   \item{hb_code}{Health Board code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://spatialdata.gov.scot/}
"boundaries_hb"

#' Data Zones (2011)
#'
#' A data set containing 2011 Scottish Data Zone geometries and their associated
#' names and codes.
#'
#' @format A data frame of class "sf" with 6,976 rows and 3 variables:
#' \describe{
#'   \item{dz_name}{Data Zone name}
#'   \item{dz_code}{Data Zone code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://spatialdata.gov.scot/}
"boundaries_dz"

#' Intermediate Zones (2011)
#'
#' A data set containing 2011 Scottish Intermediate Zone geometries and their
#' associated names and codes.
#'
#' @format A data frame of class "sf" with 1,279 rows and 3 variables:
#' \describe{
#'   \item{iz_name}{Intermediate Zone name}
#'   \item{iz_code}{Intermediate Zone code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://spatialdata.gov.scot/}
"boundaries_iz"

#' Super Output Areas (2001)
#'
#' A data set containing 2001 Northern Ireland Super Output Area geometries and
#' their associated names and codes as used following the 2011 Census results.
#'
#' @format A data frame of class "sf" with 890 rows and 3 variables:
#' \describe{
#'   \item{soa_name}{Super Output Area name}
#'   \item{soa_code}{Super Output Area code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://www.opendatani.gov.uk/}
"boundaries_soa"

#' Police Force Areas (2020)
#'
#' A data set containing 2020 Police Force Area geometries for England and Wales
#' and their associated names and codes.
#'
#' @format A data frame of class "sf" with 43 rows and 3 variables:
#' \describe{
#'   \item{pfa_name}{Police Force Area name}
#'   \item{pfa_code}{Police Force Area code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_pfa"

#' Northern Ireland Health and Social Care Trusts (2017)
#'
#' A data set containing 2017 Health and Social Care Trust geometries for
#' Northern Ireland and their associated names and codes.
#'
#' @format A data frame of class "sf" with 5 rows and 3 variables:
#' \describe{
#'   \item{trust_name}{Health and Social Care Trust name}
#'   \item{trust_code}{Health and Social Care Trust code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://www.opendatani.gov.uk/}
"boundaries_trusts_ni"

#' Wales Local Health Boards (2019)
#'
#' A data set containing 2019 Local Health Board geometries for Wales and their
#' associated names and codes.
#'
#' @format A data frame of class "sf" with 7 rows and 3 variables:
#' \describe{
#'   \item{lhb_name}{Local Health Board name}
#'   \item{lhb_code}{Local Health Board code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_lhb"

#' Lower Layer Super Output Area (2011) to Middle Layer Super Output Area (2011) Lookup
#'
#' A data set containing a lookup between 2011 Lower (LSOA) and Middle Layer Super Output Areas (MSOA).
#'
#' @format A data frame of class "tbl" with 41,729 rows and 4 variables:
#' \describe{
#'   \item{lsoa_name}{LSOA name}
#'   \item{lsoa_code}{LSOA code}
#'   \item{msoa_name}{MSOA name}
#'   \item{msoa_code}{MSOA code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lsoa_msoa"

#' Lower Layer Super Output Area (2011) to Ward (2019) Lookup
#'
#' A data set containing a lookup between 2011 Lower Layer Super Output Areas (LSOA) and Wards.
#'
#' @format A data frame of class "tbl" with 41,729 rows and 4 variables:
#' \describe{
#'   \item{lsoa_name}{LSOA name}
#'   \item{lsoa_code}{LSOA code}
#'   \item{ward_name}{Ward name}
#'   \item{ward_code}{Ward code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lsoa_ward"

#' Middle Layer Super Output Area (2011) to LAD (December 2019) Lookup
#'
#' A data set containing a lookup between 2011 Middle Super Output Areas (MSOA)
#' and 2019 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa_name}{MSOA name}
#'   \item{msoa_code}{MSOA code}
#'   \item{lad_name}{LAD name}
#'   \item{lad_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_msoa_lad"

#' Local Authority District to Region (April 2019) Lookup in England
#'
#' A data set containing a lookup between 2019 Local Authority Districts (LAD)
#' and 2019 English Regions.
#'
#' @format A data frame of class "tbl" with 317 rows and 4 variables:
#' \describe{
#'   \item{lad_name}{LAD name}
#'   \item{lad_code}{LAD code}
#'   \item{region_name}{Region name}
#'   \item{region_code}{Region code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lad_region"

#' Data Zone (2011) to Intermediate Zone (2011) to LAD (December 2019) Lookup
#'
#' A data set containing a lookup between Data Zones, Intermediate Zones and Council Areas in Scotland
#'
#' @format A data frame of class "tbl" with 6,976 rows and 6 variables:
#' \describe{
#'   \item{dz_name}{DZ name}
#'   \item{dz_code}{DZ code}
#'   \item{iz_name}{IZ name}
#'   \item{iz_code}{IZ code}
#'   \item{lad_name}{LAD name}
#'   \item{lad_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_dz_iz_lad"

#' Clinical Commissioning Group to Sustainability and Transformation
#' Partnerships (April 2020) Lookup
#'
#' A data set containing a lookup between 2020 Clinical Commissioning Groups
#' (CCG) and  Sustainability and Transformation Partnerships (STP).
#'
#' @format A data frame of class "tbl" with 135 rows and 5 variables:
#' \describe{
#'   \item{ccg_name}{CCG name}
#'   \item{ccg_code}{CCG code}
#'   \item{ccg_nhs_code}{CCG's NHS code}
#'   \item{stp_name}{STP name}
#'   \item{stp_code}{STP code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ccg_stp"

#' NHS Health Boards (2019) to Local Authority Districts (2019) Lookup
#'
#' A data set containing a lookup between 2019 NHS Health Boards (HB)
#' and Local Authority Districts (LAD), also called Council Areas in
#' Scotland.
#'
#' @format A data frame of class "tbl" with 32 rows and 4 variables:
#' \describe{
#'   \item{hb_name}{HB name}
#'   \item{hb_code}{HB code}
#'   \item{lad_name}{LAD name}
#'   \item{lad_code}{LAD code}
#'   ...
#' }
#' @source \url{https://www.opendata.nhs.scot/}
"lookup_hb_lad"

#' NHS Trusts to STP/ICS (May 2021)
#'
#' A data set containing May 2021 NHS Trusts to STP/ICS codes
#'
#' @format A data frame of class "tbl" with 218 rows and 3 variables:
#' \describe{
#'   \item{nhs_trust_code}{NHS Trust code}
#'   \item{stp_code}{STP/ICS code}
#'   \item{status}{whether the Trust is 'open' or 'closed'}
#'   ...
#' }
#' @source \url{https://digital.nhs.uk/}
"lookup_trust_stp"

#' Postcode to Local Authority District (2020) Lookup
#'
#' A data set containing a lookup between postcodes and 2020 Local Authority
#' Districts, for England, Wales, and Scotland.
#'
#' @format A data frame of class "tbl" with 2,568,780 rows and 3 variables:
#' \describe{
#'   \item{postcode}{Postcodes}
#'   \item{lad_name}{LAD name}
#'   \item{lad_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_postcode_lad"

#' Small Areas (2011) to SOAs to Local Government Districts (December 2018)
#'   Lookup with Area Classifications in Northern Ireland
#'
#' A data set containing a lookup between Small Areas, Super Output Areas,
#'   and Local Government Districts in Northern Ireland
#'
#' @format A data frame of class "tbl" with 4,537 rows and 5 variables:
#' \describe{
#'   \item{sa_code}{Small Area code}
#'   \item{soa_name}{Super Output Area name}
#'   \item{soa_code}{Super Output Area code}
#'   \item{lgd_name}{Local Government District name}
#'   \item{lgd_code}{Local Government District code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_sa_soa_lgd"

#' Lower Layer Super Output Area to Clinical Commissioning Group to
#'   Sustainability and Transformation Partnerships (April 2021) Lookup
#'
#' A data set containing a lookup between 2011 LSOAs, 2021 Clinical
#'   Commissioning Groups (CCG) and Sustainability and Transformation
#'   Partnerships (STP).
#'
#' @format A data frame of class "tbl" with 32,844 rows and 7 variables:
#' \describe{
#'   \item{lsoa_name}{LSOA name}
#'   \item{lsoa_name}{LSOA code}
#'   \item{ccg_name}{CCG name}
#'   \item{ccg_code}{CCG code}
#'   \item{ccg_nhs_code}{CCG's NHS code}
#'   \item{stp_name}{STP name}
#'   \item{stp_code}{STP code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lsoa_ccg_stp"

#' Trust to Middle Super Output Area (MSOA) lookup.
#'
#' A data set containing a lookup between Trusts and MSOAs. As Trusts are not
#' coterminous within MSOAs, a proportion value is provided based on the
#' catchment areas the Trusts serve within the MSOAs.
#'
#' @format A data frame of class "tbl" with 62,662 rows and 3 variables:
#' \describe{
#'   \item{trust_code}{Trust code}
#'   \item{msoa_code}{MSOA code}
#'   \item{proportion}{The proportion of patients a Trust serves to the matching
#'   MSOA}
#'   ...
#' }
#' @source \url{https://app.box.com/s/qh8gzpzeo1firv1ezfxx2e6c4tgtrudl/}
"lookup_trust_msoa"

#' Local Authority Districts to County and Unitary Authorities lookup.
#'
#' A data set containing a lookup between December 2019 Local Authority
#' Districts and County and Unitary Authorities.
#'
#' @format A data frame of class "tbl" with 339 rows and 4 variables:
#' \describe{
#'   \item{lad_name}{LAD name}
#'   \item{lad_code}{LAD code}
#'   \item{county_ua_name}{County & UA name}
#'   \item{county_ua_code}{County & UA code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_counties_ua_lad"

#' NHS Trusts (February 2021)
#'
#' A data set containing February 2021 NHS Trusts point geometries (i.e.,
#' lat/long coordinates) and their associated names, codes, and open status.
#'
#' @format A data frame of class "sf" with 228 rows and 4 variables:
#' \describe{
#'   \item{nhs_trust_name}{NHS Trust name}
#'   \item{nhs_trust_code}{NHS Trust code}
#'   \item{status}{whether the Trust is 'open' or 'closed'}
#'   \item{geometry}{point coordinates}
#'   ...
#' }
#' @source \url{https://digital.nhs.uk/}
"points_nhs_trusts"

#' Rural-Urban Classifications for Lower Layer Super Output Areas (2011) in England and Wales
#'
#' A data set containing rural-urban classifications for LSOAs in England and Wales.
#'
#' @format A data frame of class "tbl" with 34,753 rows and 4 variables:
#' \describe{
#'   \item{lsoa_code}{LSOA code}
#'   \item{ruc_code}{Rural-Urban Classification code}
#'   \item{RUC}{Whether the LSOA is classified as 'Rural' or 'Urban'}
#'   \item{Classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"ruc_england_wales_lsoa"

#' Rural-Urban Classifications for Middle Layer Super Output Areas (2011) in England and Wales
#'
#' A data set containing rural-urban classifications for MSOAs in England and Wales.
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa_code}{MSOA code}
#'   \item{Proportion of urban areas}{The proportion of each MSOA's constituent LSOAs that are classified as urban}
#'   \item{RUC}{Whether the MSOA is classified as 'Rural' or 'Urban' based on the proportion of urban LSOAs}
#'   \item{Classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"ruc_england_wales_msoa"

#' Rural-Urban Classifications for Wards (2019) in England and Wales
#'
#' A data set containing rural-urban classifications for Wards in England and Wales.
#'
#' @format A data frame of class "tbl" with 8,023 rows and 4 variables:
#' \describe{
#'   \item{ward_code}{Ward code}
#'   \item{Proportion of urban areas}{The proportion of each Ward's constituent LSOAs that are classified as urban}
#'   \item{RUC}{Whether the Ward is classified as 'Rural' or 'Urban' based on the proportion of urban LSOAs}
#'   \item{Classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"ruc_england_wales_ward"

#' Rural-Urban Classifications for Data Zones (2011) in Scotland
#'
#' A data set containing rural-urban classifications for Data Zones in Scotland.
#'
#' @format A data frame of class "tbl" with 6,976 rows and 4 variables:
#' \describe{
#'   \item{dz_code}{Data Zone code}
#'   \item{ruc_code}{Rural-Urban Classification code}
#'   \item{RUC}{Whether the DZ is classified as 'Rural' or 'Urban'}
#'   \item{Classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://www.gov.scot/}
"ruc_scotland_dz"

#' Rural-Urban Classifications for Intermediate Zones (2011) in Scotland
#'
#' A data set containing rural-urban classifications for IZs in Scotland.
#'
#' @format A data frame of class "tbl" with 1,279 rows and 4 variables:
#' \describe{
#'   \item{iz_code}{Intermediate Zone code}
#'   \item{Proportion of urban areas}{The proportion of each Intermediate Zone's constituent Data Zones that are classified as urban}
#'   \item{RUC}{Whether the IZ is classified as 'Rural' or 'Urban' based on the proportion of urban Data Zones}
#'   \item{Classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://www.gov.scot/}
"ruc_scotland_iz"

#' Rural-Urban Classifications for Council Areas in Scotland
#'
#' A data set containing rural-urban classifications for Council Areas in Scotland.
#'
#' @format A data frame of class "tbl" with 32 rows and 4 variables:
#' \describe{
#'   \item{lad_code}{Council Area code}
#'   \item{Proportion of urban areas}{The proportion of each Council Area's constituent Data Zones that are classified as urban}
#'   \item{RUC}{Whether the Council Area is classified as 'Rural' or 'Urban' based on the proportion of urban Data Zones}
#'   \item{Classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://www.gov.scot/}
"ruc_scotland_lad"

#' Rural-Urban Classifications for Small Areas in Northern Ireland
#'
#' A data set containing rural-urban classifications for Small Areas in Northern Ireland.
#'
#' @format A data frame of class "tbl" with 4,537 rows and 4 variables:
#' \describe{
#'   \item{sa_code}{Small Area code}
#'   \item{ruc_code}{Rural-Urban Classification code}
#'   \item{RUC}{Whether the SA is classified as 'Rural' or 'Urban'}
#'   \item{Classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://www.nisra.gov.uk/}
"ruc_northern_ireland_sa"

#' Rural-Urban Classifications for Super Output Areas in Northern Ireland
#'
#' A data set containing rural-urban classifications for SOAs in Northern Ireland.
#'
#' @format A data frame of class "tbl" with 890 rows and 4 variables:
#' \describe{
#'   \item{soa_code}{Super Output Area code}
#'   \item{Proportion of urban areas}{The proportion of each SOA's constituent Small Areas that are classified as urban}
#'   \item{RUC}{Whether the SOA is classified as 'Rural' or 'Urban' based on the proportion of urban Small Areas}
#'   \item{Classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://www.nisra.gov.uk/}
"ruc_northern_ireland_soa"

#' Population estimates for Output Areas in England and Wales (mid-2019 estimates)
#'
#' A data set containing mid-2019 population estimates for Output Areas in England and Wales.
#'
#' @format A data frame of class "tbl" with 181,408 rows and 94 variables:
#' \describe{
#'   \item{oa_name}{OA code}
#'   \item{lsoa_code}{LSOA code}
#'   \item{total_population}{Total number of people living in each Output Area}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_msoa"

#' Population estimates for LSOAs in England and Wales (mid-2019 estimates)
#'
#' A data set containing mid-2019 population estimates for Lower Layer Super Output Areas in England and Wales.
#'
#' @format A data frame of class "tbl" with 34,753 rows and 94 variables:
#' \describe{
#'   \item{lsoa_name}{LSOA name}
#'   \item{lsoa_code}{LSOA code}
#'   \item{total_population}{Total number of people living in each LSOA}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_lsoa"

#' Population estimates for MSOAs in England and Wales (mid-2019 estimates)
#'
#' A data set containing mid-2019 population estimates for Middle Layer Super Output Areas in England and Wales.
#'
#' @format A data frame of class "tbl" with 7,201 rows and 94 variables:
#' \describe{
#'   \item{msoa_name}{MSOA name}
#'   \item{msoa_code}{MSOA code}
#'   \item{total_population}{Total number of people living in each MSOA}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_msoa"

#' Population estimates for CCGs in England and Wales (mid-2019 estimates)
#'
#' A data set containing mid-2019 population estimates for Clinical Commissioning Groups in England and Wales.
#'
#' @format A data frame of class "tbl" with 135 rows and 94 variables:
#' \describe{
#'   \item{ccg_name}{CCG name}
#'   \item{ccg_code}{CCG code}
#'   \item{total_population}{Total number of people living in each CCG}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_ccg"

#' Population estimates for Data Zones in Scotland (mid-2019 estimates)
#'
#' A data set containing mid-2019 population estimates by age and sex for Data Zones in Scotland.
#'
#' @format A data frame of class "tbl" with 20,928 rows and 94 variables:
#' \describe{
#'   \item{dz_code}{Data Zone code}
#'   \item{total_population}{Total number of people living in each DZ}
#'   \item{sex}{'Female', 'Male' or 'All'}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://www.opendata.nhs.scot/}
"population_dz"

#' Population estimates for Intermediate Zones in Scotland (mid-2019 estimates)
#'
#' A data set containing mid-2019 population estimates by age and sex for Intermediate Zones in Scotland.
#'
#' @format A data frame of class "tbl" with 3,837 rows and 94 variables:
#' \describe{
#'   \item{iz_code}{Intermediate Zone code}
#'   \item{total_population}{Total number of people living in each IZ}
#'   \item{sex}{'Female', 'Male' or 'All'}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://www.opendata.nhs.scot/}
"population_iz"

#' Population estimates for Super Output Areas in Northern Ireland (mid-2019 estimates)
#'
#' A data set containing mid-2019 population estimates by age and sex for Super Output Areas in Northern Ireland.
#'
#' @format A data frame of class "tbl" with 2,670 rows and 8 variables:
#' \describe{
#'   \item{soa_name}{Super Output Area name}
#'   \item{soa_code}{Super Output Area code}
#'   \item{total_population}{Total number of people living in each SOA}
#'   \item{sex}{'Female', 'Male' or 'All'}
#'   \item{`00-15`}{Number of people aged 0 to 15}
#'   \item{`16-39`}{Number of people aged 16 to 39}
#'   \item{`40-65`}{Number of people aged 40 to 64}
#'   \item{`65+`}{Number of people aged 65+}
#'   ...
#' }
#' @source \url{https://www.nisra.gov.uk}
"population_soa"

#' Population estimates for Local Authority Districts (mid-2019)
#'
#' A data set containing mid-2019 population estimates for Local Authortiy
#' Districts (April 2020 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 376 rows and 94 variables:
#' \describe{
#'   \item{lad_name}{LAD name}
#'   \item{lad_code}{LAD code}
#'   \item{total_population}{Total number of people living in each LAD}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_lad"

#' Population estimates for Counties and Unitary Authorities (mid-2019)
#'
#' A data set containing mid-2019 population estimates for County and Unitary
#' Authority Districts (April 2019 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 216 rows and 94 variables:
#' \describe{
#'   \item{county_ua_name}{County or Unitary Authority name}
#'   \item{county_ua_code}{County or Unitary Authority code}
#'   \item{total_population}{Total number of people living in each area}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_counties_ua"

#' Populations estimates for ethnic group categories in LSOAs (Census 2011)
#'
#' 2011 population estimates for ethnic group categories in Lower Layer Super
#'   Output Areas (LSOAs) in England and Wales.
#'
#' The overall categories are: White, Asian/Asian British,
#'   Black/African/Caribbean/Black British, Mixed/multiple ethnic groups,
#'   and Other ethnic group.
#'
#' @format A data frame of class "tbl" with 173,765 rows and 3 variables:
#' \describe{
#'   \item{lsoa_code}{Lower Layer Super Output Area code}
#'   \item{ethnicity}{Ethnic group name}
#'   \item{n_people}{Number of people}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_lsoa_ethnicity_census"

#' Populations estimates for ethnic groups in LSOAs (Census 2011)
#'
#' 2011 population estimates for ethnic groups in Lower Layer Super
#'   Output Areas (LSOAs) in England and Wales.
#'
#' The ethnic groups are listed here:
#'   https://www.ethnicity-facts-figures.service.gov.uk/style-guide/ethnic-groups
#'
#' @format A data frame of class "tbl" with 625,554 rows and 3 variables:
#' \describe{
#'   \item{lsoa_code}{Lower Layer Super Output Area code}
#'   \item{ethnicity}{Ethnic group name}
#'   \item{n_people}{Number of people}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_lsoa_ethnicity_census_detailed"

#' Population estimates for Northern Ireland Health and Social Care Trusts (2020)
#'
#' A data set containing 2020 population estimates for Northern Ireland Health
#' and Social Care Trusts
#'
#' @format A data frame of class "tbl" with 376 rows and 94 variables:
#' \describe{
#'   \item{trust_name}{Trust name}
#'   \item{trust_code}{Trust code}
#'   \item{population}{Total number of people living in each Trust}
#'   ...
#' }
#' @source \url{https://data.gov.uk/}
"population_trusts_ni"

#' Population density for Middle Layer Super Output Areas
#'
#' A data set containing population density for Middle Layer Super Output Areas
#' based on mid-2019 population estimates and MSOA area in square kilometres
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa_code}{MSOA code}
#'   \item{area_km_square}{MSOA area in square kilometres}
#'   \item{total_population}{Total number of people living in each MSOA}
#'   \item{density}{Population density = total_population / area_km_square}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"density_msoa"
