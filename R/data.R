#' Clinical Commissioning Groups (April 2021)
#'
#' A data set containing 2021 Clinical Commissioning Group (CCG) geometries and
#' their associated names and codes. Boundaries are ultra generalised (500m).
#'
#' @format A data frame of class "sf" with 106 rows and 3 variables:
#' \describe{
#'   \item{ccg21_name}{CCG name}
#'   \item{ccg21_code}{CCG code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_ccg21"

#' Countries (December 2020)
#'
#' A data set containing 2020 Country geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 4 rows and 3 variables:
#' \describe{
#'   \item{country20_name}{country name}
#'   \item{country20_code}{Country code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_countries20"

#' Data Zones (2011)
#'
#' A data set containing 2011 Scottish Data Zone geometries and their associated
#' names and codes.
#'
#' @format A data frame of class "sf" with 6,976 rows and 3 variables:
#' \describe{
#'   \item{dz11_name}{Data Zone name}
#'   \item{dz11_code}{Data Zone code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://spatialdata.gov.scot/}
"boundaries_dz11"

#' Health Boards (2019)
#'
#' A data set containing 2019 NHS Health Board geometries and their associated
#' names and codes.
#'
#' @format A data frame of class "sf" with 14 rows and 3 variables:
#' \describe{
#'   \item{hb19_name}{Health Board name}
#'   \item{hb19_code}{Health Board code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://spatialdata.gov.scot/}
"boundaries_hb19"

#' Intermediate Zones (2011)
#'
#' A data set containing 2011 Scottish Intermediate Zone geometries and their
#' associated names and codes.
#'
#' @format A data frame of class "sf" with 1,279 rows and 3 variables:
#' \describe{
#'   \item{iz11_name}{Intermediate Zone name}
#'   \item{iz11_code}{Intermediate Zone code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://spatialdata.gov.scot/}
"boundaries_iz11"

#' Wales Local Health Boards (2020)
#'
#' A data set containing 2020 Local Health Board geometries for Wales and their
#' associated names and codes.
#'
#' @format A data frame of class "sf" with 7 rows and 3 variables:
#' \describe{
#'   \item{lhb20_name}{Local Health Board name}
#'   \item{lhb20_code}{Local Health Board code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_lhb20"

#' Lower Layer Super Output Areas (2011)
#'
#' A data set containing 2011 Lower Super Output Area (LSOA) geometries and
#' their associated names and codes. Full clipped boundaries were simplified
#' using the Visvalingam algorithm set to a weighting of 0.7 with a retaining
#' proportion of 0.895 points.
#'
#' @format A data frame of class "sf" with 34,753 rows and 3 variables:
#' \describe{
#'   \item{lsoa11_name}{LSOA name}
#'   \item{lsoa11_code}{LSOA code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_lsoa11"

#' Local Authority Districts (December 2019)
#'
#' A data set containing 2019 Local Authority Districts (LAD) geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 382 rows and 3 variables:
#' \describe{
#'   \item{ltla19_name}{LAD name}
#'   \item{ltla19_code}{LAD code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_ltla19"

#' Local Authority Districts (December 2020)
#'
#' A data set containing 2020 Local Authority Districts (LAD) geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 379 rows and 3 variables:
#' \describe{
#'   \item{ltla20_name}{LAD name}
#'   \item{ltla20_code}{LAD code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_ltla20"

#' Local Authority Districts (December 2021)
#'
#' A data set containing 2021 Local Authority Districts (LAD) geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 374 rows and 3 variables:
#' \describe{
#'   \item{ltla21_name}{LAD name}
#'   \item{ltla21_code}{LAD code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_ltla21"

#' Middle Layer Super Output Areas (2011)
#'
#' A data set containing 2011 Middle Super Output Area (MSOA) geometries and
#' their associated names and codes. Super generalised (200m) boundaries were
#' simplified using the Visvalingam algorithm set to a weighting of 0.7 with a
#' retaining proportion of 0.05 points.
#'
#' @format A data frame of class "sf" with 7,201 rows and 3 variables:
#' \describe{
#'   \item{msoa11_name}{MSOA name}
#'   \item{msoa11_code}{MSOA code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_msoa11"

#' Police Force Areas (2020)
#'
#' A data set containing 2020 Police Force Area geometries for England and Wales
#' and their associated names and codes.
#'
#' @format A data frame of class "sf" with 43 rows and 3 variables:
#' \describe{
#'   \item{pfa20_name}{Police Force Area name}
#'   \item{pfa20_code}{Police Force Area code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_pfa20"

#' Regions (December 2021)
#'
#' A data set containing December 2021 England Region geometries and
#' their associated names and codes.
#'
#' @format A data frame of class "sf" with 890 rows and 3 variables:
#' \describe{
#'   \item{region21_name}{Region name}
#'   \item{region21_code}{Region code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_region21"

#' Super Output Areas (2011)
#'
#' A data set containing 2011 Northern Ireland Super Output Area geometries and
#' their associated names and codes as used following the 2011 Census results.
#'
#' @format A data frame of class "sf" with 890 rows and 3 variables:
#' \describe{
#'   \item{soa11_name}{Super Output Area name}
#'   \item{soa11_code}{Super Output Area code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://www.nisra.gov.uk/}
"boundaries_soa11"

#' Sustainability and Transformation Partnerships (April 2021)
#'
#' A data set containing 2021 Sustainability and Transformation Partnerships
#' (STP) geometries and their associated names and codes. Boundaries are ultra
#' generalised (500m).
#'
#' @format A data frame of class "sf" with 42 rows and 3 variables:
#' \describe{
#'   \item{stp21_name}{STP name}
#'   \item{stp21_code}{STP code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_stp21"

#' Northern Ireland Health and Social Care Trusts (2017)
#'
#' A data set containing 2017 Health and Social Care Trust geometries for
#' Northern Ireland and their associated names and codes.
#'
#' @format A data frame of class "sf" with 5 rows and 3 variables:
#' \describe{
#'   \item{trust18_name}{Health and Social Care Trust name}
#'   \item{trust18_code}{Health and Social Care Trust code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://www.opendatani.gov.uk/}
"boundaries_trusts_ni18"

#' Counties and Unitary Authorities (December 2019)
#'
#' A data set containing 2019 County and Unitary Authority (UA) geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 216 rows and 3 variables:
#' \describe{
#'   \item{utla19_name}{county and UA name}
#'   \item{utla19_code}{county and UA code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_utla19"

#' Counties and Unitary Authorities (December 2020)
#'
#' A data set containing 2020 County and Unitary Authority (UA) geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 216 rows and 3 variables:
#' \describe{
#'   \item{utla20_name}{county and UA name}
#'   \item{utla20_code}{county and UA code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_utla20"

#' Counties and Unitary Authorities (May 2021)
#'
#' A data set containing 2021 County and Unitary Authority (UA) geometries and
#' their associated names and codes. Boundaries are Ultra Generalised (500m) -
#' clipped to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 217 rows and 3 variables:
#' \describe{
#'   \item{utla21_name}{county and UA name}
#'   \item{utla21_code}{county and UA code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_utla21"

#' VCSEP regions (2022).
#'
#' A data set containing geometries for the Voluntary and Community Sector
#' Emergency Partnership regions
#'
#' @format A data frame of class "tbl" with 5 rows and 2 variables:
#' \describe{
#'   \item{vcsep_region}{VCSEP region name}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://github.com/VCS-Emergencies-Partnership/ad-hoc-analysis/tree/main/analysis/vcsep_regions_boundaries}
"boundaries_vcsep22"

#' Wards / Electoral Divisions (December 2021)
#'
#' A data set containing 2021 Ward / Electoral Division geometries and their
#' associated names and codes. Boundaries are Super generalised (200m) - clipped
#' to the coastline (Mean High Water mark).
#'
#' @format A data frame of class "sf" with 8,694 rows and 3 variables:
#' \describe{
#'   \item{ward21_name}{ward name}
#'   \item{ward21_code}{ward code}
#'   \item{geometry}{multipolygon coordinates}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"boundaries_wards21"

#' NHS Trusts (February 2022)
#'
#' A data set containing February 2022 NHS Trusts point geometries (i.e.,
#' lat/long coordinates) and their associated names, codes, and open status.
#'
#' @format A data frame of class "sf" with 218 rows and 4 variables:
#' \describe{
#'   \item{nhs_trust22_name}{NHS Trust name}
#'   \item{nhs_trust22_code}{NHS Trust code}
#'   \item{status}{whether the Trust is 'open' or 'closed'}
#'   \item{geometry}{point coordinates}
#'   ...
#' }
#' @source \url{https://digital.nhs.uk/}
"points_nhs_trusts22"

#' NHS England Hopsitals (July 2022)
#'
#' A data set containing July 2022 NHS England hospital point geometries (i.e.,
#' lat/long coordinates) and their associated names.
#'
#' @format A data frame of class "sf" with 1,061 rows and 2 variables:
#' \describe{
#'   \item{hospital22_name}{NHS England hospital}
#'   \item{geometry}{point coordinates}
#'   ...
#' }
#' @source \url{https://digital.nhs.uk/}
"points_hospitals22"

#' Clinical Commissioning Group (2021) to Sustainability and Transformation
#' Partnership (2021) Lookup
#'
#' A data set containing a lookup between CCG and STP in Scotland
#'
#' @format A data frame of class "tbl" with 106 rows and 6 variables:
#' \describe{
#'   \item{ccg21_code}{CCG code}
#'   \item{ccg21_nhs_code}{CCG's NHS code}
#'   \item{ccg21_name}{CCG name}
#'   \item{stp21_code}{STP code}
#'   \item{stp21_nhs_code}{STP's NHS code}
#'   \item{stp21_name}{STP name}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ccg21_stp21"

#' Data Zone (2011) to Intermediate Zone (2011) to LAD (December 2019) Lookup
#'
#' A data set containing a lookup between Data Zones, Intermediate Zones and Council Areas in Scotland
#'
#' @format A data frame of class "tbl" with 6,976 rows and 6 variables:
#' \describe{
#'   \item{dz11_name}{DZ name}
#'   \item{dz11_code}{DZ code}
#'   \item{iz11_name}{IZ name}
#'   \item{iz11_code}{IZ code}
#'   \item{ltla20_name}{LAD name}
#'   \item{ltla20_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_dz11_iz11_ltla20"

#' Lower Layer Super Output Area (2011) to Clinical Commissioning Group (2021)
#' to Sustainability and Transformation Plan (2021) to Lower Tier Local
#' Authority District (2021) Lookup
#'
#' A data set containing a lookup between 2011 Lower Layer Super Output Areas to
#' 2021 Clinical Commissioning Group areas to 2021 Sustainability and
#' Transformation Plan areas to 2021 Lower Tier Local Authority Districts.
#'
#' @format A data frame of class "tbl" with 32,844 rows and 8 variables:
#' \describe{
#'   \item{lsoa11_name}{LSOA name}
#'   \item{lsoa11_code}{LSOA code}
#'   \item{ccg21_name}{CCG name}
#'   \item{ccg21_code}{CCG code}
#'   \item{stp21_name}{STP name}
#'   \item{stp21_code}{STP code}
#'   \item{ltla21_name}{LTLA name}
#'   \item{ltla21_code}{LTLA code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lsoa11_ccg21_stp21_ltla21"

#' Lower Layer Super Output Area (2011) to Lower Layer Super Output Area (2021) to LAD (December 2022) Lookup
#'
#' A data set containing a lookup between 2011 Lower Super Output Areas (LSOA)
#' and 2021 Lower Super Output Areas (LSOA) and 2022 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 34,753 rows and 6 variables:
#' \describe{
#'   \item{lsoa11_name}{LSOA 11 name}
#'   \item{lsoa11_code}{LSOA 11 code}
#'   \item{lsoa21_name}{LSOA 21 name}
#'   \item{lsoa21_code}{LSOA 21 code}
#'   \item{ltla22_name}{LAD name}
#'   \item{ltla22_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lsoa11_lsoa21_ltla22"

#' Lower Layer Super Output Area (2011) to LAD (December 2019) Lookup
#'
#' A data set containing a lookup between 2011 Lower Super Output Areas (LSOA)
#' and 2019 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 34,753 rows and 4 variables:
#' \describe{
#'   \item{lsoa11_name}{LSOA name}
#'   \item{lsoa11_code}{LSOA code}
#'   \item{ltla19_name}{LAD name}
#'   \item{ltla19_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lsoa11_ltla19"

#' Lower Layer Super Output Area (2011) to LAD (December 2020) Lookup
#'
#' A data set containing a lookup between 2011 Lower Super Output Areas (LSOA)
#' and 2020 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 34,753 rows and 4 variables:
#' \describe{
#'   \item{lsoa11_name}{LSOA name}
#'   \item{lsoa11_code}{LSOA code}
#'   \item{ltla20_name}{LAD name}
#'   \item{ltla20_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lsoa11_ltla20"

#' Lower Layer Super Output Area (2011) to LAD (December 2021) Lookup
#'
#' A data set containing a lookup between 2011 Lower Super Output Areas (LSOA)
#' and 2021 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 34,753 rows and 4 variables:
#' \describe{
#'   \item{lsoa11_name}{LSOA name}
#'   \item{lsoa11_code}{LSOA code}
#'   \item{ltla21_name}{LAD name}
#'   \item{ltla21_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lsoa11_ltla21"

#' Lower Layer Super Output Area (2011) to Middle Layer Super Output Area (2011) Lookup
#'
#' A data set containing a lookup between 2011 Lower (LSOA) and Middle Layer Super Output Areas (MSOA).
#'
#' @format A data frame of class "tbl" with 41,729 rows and 4 variables:
#' \describe{
#'   \item{lsoa11_name}{LSOA name}
#'   \item{lsoa11_code}{LSOA code}
#'   \item{msoa11_name}{MSOA name}
#'   \item{msoa11_code}{MSOA code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lsoa11_msoa11"

#' Local Authority District (2019) to British Red Cross area lookup
#'
#' A data set containing a lookup between UK Local Authority Districts and
#' British Red Cross operational areas.
#'
#' @format A data frame of class "tbl" with 382 rows and 2 variables:
#' \describe{
#'   \item{ltla19_code}{LAD code}
#'   \item{brc_area}{British Red Cross area name}
#'   ...
#' }
#' @source \url{https://redcross.org.uk/}
"lookup_ltla19_brc"

#' Local Authority District (2021) to British Red Cross area lookup
#'
#' A data set containing a lookup between UK Local Authority Districts and
#' British Red Cross operational areas.
#'
#' @format A data frame of class "tbl" with 382 rows and 2 variables:
#' \describe{
#'   \item{ltla21_code}{LAD code}
#'   \item{brc_area}{British Red Cross area name}
#'   ...
#' }
#' @source \url{https://redcross.org.uk/}
"lookup_ltla21_brc"

#' Local Authority Districts to Combined Authorities lookup (2019).
#'
#' A data set containing a lookup between December 2019 Local Authority
#' Districts and Combined Authorities (CAUTH).
#'
#' @format A data frame of class "tbl" with 53 rows and 4 variables:
#' \describe{
#'   \item{ltla19_name}{LAD name}
#'   \item{ltla19_code}{LAD code}
#'   \item{cauth19_name}{County name}
#'   \item{cauth19_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ltla19_cauth19"

#' Local Authority Districts to Combined Authorities lookup (2020).
#'
#' A data set containing a lookup between December 2020 Local Authority
#' Districts and Combined Authorities (CAUTH).
#'
#' @format A data frame of class "tbl" with 53 rows and 4 variables:
#' \describe{
#'   \item{ltla20_name}{LAD name}
#'   \item{ltla20_code}{LAD code}
#'   \item{cauth20_name}{County name}
#'   \item{cauth20_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ltla20_cauth20"

#' Local Authority Districts to Combined Authorities lookup (2021).
#'
#' A data set containing a lookup between December 2021 Local Authority
#' Districts and Combined Authorities (CAUTH).
#'
#' @format A data frame of class "tbl" with 53 rows and 4 variables:
#' \describe{
#'   \item{ltla21_name}{LAD name}
#'   \item{ltla21_code}{LAD code}
#'   \item{cauth21_name}{County name}
#'   \item{cauth21_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ltla21_cauth21"

#' Local Authority Districts to Fire and Rescue Authorities lookup (2021).
#'
#' A data set containing a lookup between April 2021 Local Authority
#' Fire and Rescue Authorities (FRA)
#'
#' @format A data frame of class "tbl" with 331 rows and 4 variables:
#' \describe{
#'   \item{ltla21_name}{LAD name}
#'   \item{ltla21_code}{LAD code}
#'   \item{fra21_name}{FRA name}
#'   \item{fra21_code}{FRA code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ltla21_fra21"

#' Changes to England Local Authority codes over time (from 2019).
#'
#' A data set containing a lookup of the England Local Authority changes
#' between 2019, 2020 and 2021.
#'
#' @format A data frame of class "tbl" with 382 rows and 6 variables:
#' \describe{
#'   \item{ltla19_name}{2019 LAD name}
#'   \item{ltla19_code}{2019 LAD code}
#'   \item{ltla20_name}{2020 LAD name}
#'   \item{ltla20_code}{2020 LAD code}
#'   \item{ltla21_name}{2021 LAD name}
#'   \item{ltla21_code}{2021 LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/datasets/code-history-database-december-2021-for-the-united-kingdom/about}
"lookup_ltla_ltla"

#' Local Authority District to Region (December 2019) Lookup in England
#'
#' A data set containing a lookup between 2019 Local Authority Districts (LAD)
#' and 2019 English Regions.
#'
#' @format A data frame of class "tbl" with 317 rows and 4 variables:
#' \describe{
#'   \item{ltla19_name}{LAD name}
#'   \item{ltla19_code}{LAD code}
#'   \item{region19_name}{Region name}
#'   \item{region19_code}{Region code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ltla19_region19"

#' Local Authority District to Region (December 2020) Lookup in England
#'
#' A data set containing a lookup between 2020 Local Authority Districts (LAD)
#' and 2020 English Regions.
#'
#' @format A data frame of class "tbl" with 314 rows and 4 variables:
#' \describe{
#'   \item{ltla20_name}{LAD name}
#'   \item{ltla20_code}{LAD code}
#'   \item{region20_name}{Region name}
#'   \item{region20_code}{Region code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ltla20_region20"

#' Local Authority District to Region (April 2021) Lookup in England
#'
#' A data set containing a lookup between 2021 Local Authority Districts (LAD)
#' and 2021 English Regions.
#'
#' @format A data frame of class "tbl" with 317 rows and 4 variables:
#' \describe{
#'   \item{ltla21_name}{LAD name}
#'   \item{ltla21_code}{LAD code}
#'   \item{region21_name}{Region name}
#'   \item{region21_code}{Region code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ltla21_region21"

#' Local Authority Districts to County and Unitary Authorities lookup (2019).
#'
#' A data set containing a lookup between December 2019 Local Authority
#' Districts and County and Unitary Authorities.
#'
#' @format A data frame of class "tbl" with 339 rows and 4 variables:
#' \describe{
#'   \item{ltla19_name}{LAD name}
#'   \item{ltla19_code}{LAD code}
#'   \item{utla19_name}{County name}
#'   \item{utla19_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ltla19_utla19"

#' Local Authority Districts to County and Unitary Authorities lookup (2020).
#'
#' A data set containing a lookup between December 2020 Local Authority
#' Districts and County and Unitary Authorities.
#'
#' @format A data frame of class "tbl" with 336 rows and 4 variables:
#' \describe{
#'   \item{ltla20_name}{LAD name}
#'   \item{ltla20_code}{LAD code}
#'   \item{utla20_name}{County name}
#'   \item{utla20_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ltla20_utla20"

#' Local Authority Districts to County and Unitary Authorities lookup (2021).
#'
#' A data set containing a lookup between December 2021 Local Authority
#' Districts and County and Unitary Authorities.
#'
#' @format A data frame of class "tbl" with 331 rows and 4 variables:
#' \describe{
#'   \item{ltla21_name}{LAD name}
#'   \item{ltla21_code}{LAD code}
#'   \item{utla21_name}{County name}
#'   \item{utla21_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ltla21_utla21"

#' Local Authority Districts to VCSEP regions lookup (2021).
#'
#' A data set containing a lookup between December 2021 Local Authority
#' Districts and Voluntary and Community Sector Emergency Partnership regions
#'
#' @format A data frame of class "tbl" with 309 rows and 3 variables:
#' \describe{
#'   \item{ltla21_name}{LAD name}
#'   \item{ltla21_code}{LAD code}
#'   \item{vcsep_region}{VCSEP region name}
#'   ...
#' }
#' @source \url{https://github.com/VCS-Emergencies-Partnership/ad-hoc-analysis/tree/main/analysis/vcsep_regions_boundaries}
"lookup_ltla21_vcsep22"

#' Middle Layer Super Output Area (2011) to LAD (December 2019) Lookup
#'
#' A data set containing a lookup between 2011 Middle Super Output Areas (MSOA)
#' and 2019 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa11_name}{MSOA name}
#'   \item{msoa11_code}{MSOA code}
#'   \item{ltla19_name}{LAD name}
#'   \item{ltla19_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_msoa11_ltla19"

#' Middle Layer Super Output Area (2011) to LAD (December 2020) Lookup
#'
#' A data set containing a lookup between 2011 Middle Super Output Areas (MSOA)
#' and 2020 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa11_name}{MSOA name}
#'   \item{msoa11_code}{MSOA code}
#'   \item{ltla20_name}{LAD name}
#'   \item{ltla20_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_msoa11_ltla20"

#' Middle Layer Super Output Area (2011) to LAD (December 2021) Lookup
#'
#' A data set containing a lookup between 2011 Middle Super Output Areas (MSOA)
#' and 2021 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa11_name}{MSOA name}
#'   \item{msoa11_code}{MSOA code}
#'   \item{ltla21_name}{LAD name}
#'   \item{ltla21_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_msoa11_ltla21"

#' Middle Layer Super Output Area (2011) to Middle Layer Super Output Area (2021) to LAD (December 2022) Lookup
#'
#' A data set containing a lookup between 2011 Middle Super Output Areas (MSOA)
#' and 2021 Middle Super Output Areas (MSOA) and 2022 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 7.201 rows and 6 variables:
#' \describe{
#'   \item{msoa11_name}{MSOA 11 name}
#'   \item{msoa11_code}{MSOA 11 code}
#'   \item{msoa21_name}{MSOA 21 name}
#'   \item{msoa21_code}{MSOA 21 code}
#'   \item{ltla22_name}{LAD name}
#'   \item{ltla22_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_msoa11_msoa21_ltla22"

#' England NHS Trusts (2022) to LTLA (2021) Lookup
#'
#' A data set containing a lookup between 2022 England NHS Trusts and 2021 LTLA
#' areas.
#'
#' # Copyright reference
#'
#' Office for Health Improvement & Disparities. NHS Acute (Hospital) Trust
#' Catchment Populations. 18.10.2022. https://AcuteTrustCatchmentPopulation/app.powerbi.com
#' © Crown copyright 2022
#'
#' @format A data frame of class "tbl" with 574,104 rows and 4 variables:
#' \describe{
#'   \item{ltla21_code}{LTLA code}
#'   \item{nhs_trust22_code}{NHS Trust code}
#'   \item{proportion_trust_came_from_ltla}{The proportion of patients from all admissions from a given Trust that came from a given LTLA}
#'   ...
#' }
#' @source \url{https://app.box.com/s/qh8gzpzeo1firv1ezfxx2e6c4tgtrudl}
"lookup_nhs_trusts22_ltla21"

#' England NHS Trusts (2022) to MSOA (2011) Lookup
#'
#' A data set containing a lookup between 2022 England NHS Trusts and 2011 LSOA
#' areas.
#'
#' The population size of an MSOA is much smaller than the population of people
#' who attend a given Trust. This means that the proportion of patients from an
#' MSOA that go to a Trust will be much higher than the proprotion of patients
#' from a Trust that came from an MSOA. This is because Trusts serve many more
#' MSOA's than MSOA patients go to different trusts.
#'
#' # Copyright reference
#'
#' Office for Health Improvement & Disparities. NHS Acute (Hospital) Trust
#' Catchment Populations. 18.10.2022. https://AcuteTrustCatchmentPopulation/app.powerbi.com
#' © Crown copyright 2022
#'
#' @format A data frame of class "tbl" with 574,104 rows and 4 variables:
#' \describe{
#'   \item{msoa11_code}{MSOA code}
#'   \item{nhs_trust22_code}{NHS Trust code}
#'   \item{proportion_msoa_went_to_trust}{The proportion of patients from all admissions from a given MSOA that went to a given Trust}
#'   \item{proportion_trust_came_from_msoa}{The proportion of patients from all admissions from a given Trust that came from a given MSOA}
#'   ...
#' }
#' @source \url{https://app.box.com/s/qh8gzpzeo1firv1ezfxx2e6c4tgtrudl}
"lookup_nhs_trusts22_msoa11"

#' NHS Trusts (February 2022) to NHS Regions (April 2021) Lookup
#'
#' A data set containing February 2022 NHS Trusts and their associated names,
#' codes, and open status, with a lookup to NHS Regions (April 2021).
#'
#' @format A data frame of class "tbl" with 214 rows and 6 variables:
#' \describe{
#'   \item{nhs_trust22_code}{NHS Trust code}
#'   \item{nhs_trust22_name}{NHS Trust name}
#'   \item{nhs_region21_nhs_code}{NHS Region code (NHS version)}
#'   \item{nhs_region21_ons_code}{NHS Region code (ONS version)}
#'   \item{nhs_region21_name}{NHS Region name}
#'   \item{status}{whether the Trust is 'open' or 'closed'}
#'   ...
#' }
#' @source \url{https://digital.nhs.uk/}
"lookup_nhs_trusts22_nhs_region21"

#' England NHS Trusts (2022) to STP/ICS (2021) Lookup
#'
#' A data set containing a lookup between 2022 England NHS Trusts and 2021 STP
#' areas.
#'
#' @format A data frame of class "tbl" with 209 rows and 4 variables:
#' \describe{
#'   \item{nhs_trust22_name}{NHS Trust name}
#'   \item{nhs_trust22_code}{NHS Trust code}
#'   \item{stp21_name}{STP name}
#'   \item{stp21_code}{STP code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_nhs_trusts22_stp21"

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
#'   \item{oa11_code}{OA code}
#'   \item{lsoa11_code}{LSOA code}
#'   \item{msoa11_code}{MSOA code}
#'   \item{ltla20_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_postcode_oa11_lsoa11_msoa11_ltla20"

#' Small Areas (2011) to SOAs to Local Government Districts (December 2018)
#'   Lookup with Area Classifications in Northern Ireland
#'
#' A data set containing a lookup between Small Areas, Super Output Areas,
#'   and Local Government Districts in Northern Ireland
#'
#' @format A data frame of class "tbl" with 4,537 rows and 5 variables:
#' \describe{
#'   \item{sa11_code}{Small Area code}
#'   \item{soa11_name}{Super Output Area name}
#'   \item{soa11_code}{Super Output Area code}
#'   \item{lgd18_name}{Local Government District name}
#'   \item{lgd18_code}{Local Government District code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_sa11_soa11_lgd18"

#' NHS Trust and Orginisation Changes
#'
#' A data set containing a lookup of NHS Trust and organisational changes
#'
#' @format A data frame of class "tbl" with 25,480 rows and 3 variables:
#' \describe{
#'   \item{old_code}{The old organisation code}
#'   \item{new_code}{The new organisation code}
#'   \item{date}{The date of the change}
#'   ...
#' }
#' @source \url{https://digital.nhs.uk/}
"lookup_trust_trust"

#' Ward (December 2021) to LTLA (December 2021) Lookup
#'
#' A data set containing a lookup between 2021 wards and 2021 Lower Tier Local
#' Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 8,694 rows and 4 variables:
#' \describe{
#'   \item{ward21_name}{MSOA name}
#'   \item{ward21_code}{MSOA code}
#'   \item{ltla21_name}{LAD name}
#'   \item{ltla21_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ward21_ltla21"

#' Names and codes for NHS Scotland Health Boards (2014 - 2019)
#'
#' @format A data frame of class "tbl" with 18 rows and 4 variables:
#' \describe{
#'   \item{hb19_name}{Health Board name}
#'   \item{hb19_code}{Health Board code}
#'   \item{date_enacted}{Date Health Board Code was enacted}
#'   \item{date_archived}{Date Health Board Code was archived}
#'   ...
#' }
#' @source \url{https://www.opendata.nhs.scot/}
"names_codes_hb19"

#' Rural-Urban Classifications for Data Zones (2011) in Scotland
#'
#' A data set containing rural-urban classifications for Data Zones in Scotland.
#'
#' @format A data frame of class "tbl" with 6,976 rows and 4 variables:
#' \describe{
#'   \item{dz11_code}{Data Zone code}
#'   \item{ruc16_code}{Rural-Urban Classification code}
#'   \item{ruc}{Whether the DZ is classified as 'Rural' or 'Urban'}
#'   \item{classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://www.gov.scot/}
"ruc16_dz11"

#' Rural-Urban Classifications for Lower Layer Super Output Areas (2011) in
#' England and Wales
#'
#' A data set containing rural-urban classifications for LSOAs in England and
#' Wales.
#'
#' @format A data frame of class "tbl" with 34,753 rows and 4 variables:
#' \describe{
#'   \item{lsoa11_code}{LSOA code}
#'   \item{ruc11_code}{Rural-Urban Classification code}
#'   \item{ruc}{Whether the LSOA is classified as 'Rural' or 'Urban'}
#'   \item{classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"ruc11_lsoa11"

#' Rural-Urban Classifications for Middle Layer Super Output Areas (2011) in
#' England and Wales
#'
#' A data set containing rural-urban classifications for MSOAs in England and
#' Wales.
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa11_code}{MSOA code}
#'   \item{ruc11_code}{Rural-Urban Classification code}
#'   \item{ruc}{Whether the MSOA is classified as 'Rural' or 'Urban'}
#'   \item{classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"ruc11_msoa11"

#' Rural-Urban Classifications for wards (2011) in England and Wales
#'
#' A data set containing rural-urban classifications for wards in England and
#' Wales.
#'
#' @format A data frame of class "tbl" with 8,570 rows and 4 variables:
#' \describe{
#'   \item{ward11_code}{Ward code}
#'   \item{ruc11_code}{Rural-Urban Classification code}
#'   \item{ruc}{Whether the ward is classified as 'Rural' or 'Urban'}
#'   \item{classification}{A more detailed description of the classification}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"ruc11_wards11"
