#' Aggregate LSOAs'21 to LSOA'11 for Left Behind Areas - England and Wales
#'
#' Changes were made in England and Wales to 2011 LSOA codes in 2021 to reflect
#' population and household changes. Change codes:
#' - U = Unchanged - 31,810 LSOAs remained unchanged from 2011 to 2021
#' - S = Split - 834 LSOAs were split from 2011 to 2021 into two or more
#' - M = Merged - 194 LSOAs were merged from 2011 to 2021 with one or more
#' - X = Fragmented - 6 LSOAs were fragmented/redesigned from 2011 to 2021
#'
#' Aggregation strategy going from 2021 codes to 2011 codes:
#' - change_code == "U": no action required
#' - change_code == "S": if ANY of the 2021 LSOAs resulting from the split is
#'   left behind, 2011 LSOA is considered left-behind
#' - change_code == "M": 2011 LSOA's inherit the left-behind characteristics of
#'   the 2021 LSOA that resulted from the merge: if the 2021 LSOA is left behind,
#'   all corresponding 2011 LSOA's are considered left-behind, and vice versa
#' - change_code == "X": 2011 LSOA's inherit the left behind characteristics of
#'   their corresponding 2021 LSOA. Then group by 2011 LSOA, if any is
#'   left-behind, consider the LSOA left-behind

#' @param data Dataframe containing 2021 LSOA codes with boolean LBA data
#' @return Dataframe containing the aggregated 2011 LSOA codes
#' @importFrom sf st_geometry
#' @export
#'
aggregate_lba_lsoas <- function(data) {
  lsoa_lsoa <- geographr::lookup_lsoa11_lsoa21_ltla22 |>
    dplyr::distinct(lsoa11_code, lsoa21_code, change_code) |>
    dplyr::relocate(change_code, .after = lsoa21_code)

  data_u <- data |>
    dplyr::left_join(lsoa_lsoa) |>
    dplyr::filter(change_code == "U") |>
    dplyr::select(lsoa11_code, lba = `Left Behind Area?`)

  data_s <- data |>
    dplyr::left_join(lsoa_lsoa) |>
    dplyr::relocate(lsoa11_code) |>
    dplyr::filter(change_code == "S") |>
    dplyr::group_by(lsoa11_code) |>
    dplyr::summarize(lba = any(`Left Behind Area?` == TRUE)) |>
    dplyr::ungroup()

  data_m <- data |>
    dplyr::left_join(lsoa_lsoa) |>
    dplyr::relocate(lsoa11_code) |>
    dplyr::filter(change_code == "M") |>
    dplyr::select(lsoa11_code, lba = `Left Behind Area?`)

  data_x <- data |>
    dplyr::left_join(lsoa_lsoa) |>
    dplyr::relocate(lsoa11_code) |>
    dplyr::filter(change_code == "X") |>
    dplyr::group_by(lsoa11_code) |>
    dplyr::summarize(lba = any(`Left Behind Area?` == TRUE)) |>
    dplyr::ungroup()

  data_aggregated <- dplyr::bind_rows(data_u, data_s, data_m, data_x)

  return(data_aggregated)
}
