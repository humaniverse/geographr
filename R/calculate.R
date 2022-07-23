#' Calculate the 'extent' scores when aggregating up small areas
#'
#' "Extent" is the proportion of the local population that live in areas
#' classified as among the most deprived in the higher geography. The
#' calculation of extent is taken from the IMD technical report Appendix N:
#'
#' "The population living in the most deprived 11 to 30 per cent of Lower-layer
#' Super Output Areas receive a sliding weight, ranging from 0.95 for those in
#' the most deprived eleventh percentile, to 0.05 for those in the most deprived
#' thirtieth percentile. In practice this means that the weight starts from 0.95
#' in the most deprived eleventh percentile, and then decreases by
#' (0.95-0.05)/19 for each of the subsequent nineteen percentiles until it
#' reaches 0.05 for the most deprived thirtieth percentile, and zero for areas
#' outside the most deprived 30 per cent"
#'
#' The direction of the scale of data inputted by the functioin always matches
#' that of the data outputted. For example if data is inputted into the function
#' where high scores equals high vulnerability, the outputted data set will hold
#' this relationship true.
#'
#' @param data Data frame containing a variable to be aggregated, lower level
#'        geography population estimates, and a higher level geographical
#'        grouping variable
#' @param var Name of the variable in the data frame containing the variable to
#'        be aggregated (e.g., score) for the lower level geography
#' @param higher_level_geography Name of the variable in the data frame
#'        containing the higher level geography names/codes
#' @param population Name of the variable in the data frame containing
#'        the population estimates of the lower level geography
#' @param weight_high_scores If TRUE higher scores are weighted, else lower
#' scores are weighted. For indicators like 'Alchol Misuse' and 'Ambulance Wait
#' Time' this should be set to TRUE. This is because higher values in these
#' outcomes indicate worse outcomes (higher vulnerability and lower capacity)
#' and this is where the weighting should be focused. For indicators like
#' 'Physical Activity' and 'Bed Availability' it should be set to FALSE. This is
#' because lower values in these outcomes indicate worse outcomes (higher
#' vulnerability and lower capacity) and this is where the weighting should be
#' focused.
#'
#' @export
calculate_extent <-
  function(data,
           var,
           higher_level_geography,
           population,
           weight_high_scores = TRUE) {
    data <-
      data |>
      dplyr::mutate(percentile = dplyr::ntile({{ var }}, 100))

    if (weight_high_scores) {
      data <-
        data |>
        dplyr::mutate(
          percentile = (max(percentile, na.rm = TRUE) + 1) - percentile
        )
    }

    data <-
      data |>
      dplyr::mutate(
        extent = dplyr::case_when(
          percentile <= 10 ~ {{ population }},
          percentile == 11 ~ {{ population }} * 0.95,
          percentile > 11 & percentile <= 30 ~ {{ population }} * (0.95 - ((0.9 / 19) * (percentile - 11))),
          TRUE ~ 0
        )
      ) |>
      dplyr::group_by({{ higher_level_geography }}) |>
      dplyr::summarise(extent = sum(extent) / sum({{ population }}))

    if (!weight_high_scores) {
      data <-
        data |>
        dplyr::mutate(extent = extent * -1)
    }

    return(data)
  }

#' Calculate proportion of small areas in the higher-level geography that are
#' within the 10% most deprived areas in the nation.
#'
#' @param data Data frame containing a variable to be aggregated, lower level
#'        geography population estimates, and a higher level geographical
#'        grouping variable
#' @param var Name of the variable in the data frame containing the variable to
#'        be aggregated (e.g. decile) for the lower level geography
#' @param higher_level_geography Name of the variable in the data frame
#'        containing the higher level geography names/codes
#' @param max_quantile Get proportion of small areas categorised as less than
#'        or equal to `max_quantile` (default = 1)
#'
#' @importFrom rlang .data
#' @export
calculate_proportion <-
  function(data,
           var,
           higher_level_geography,
           max_quantile = 1) {
    data |>
      # Label LSOAs by whether they're in top 10% most-deprived then summarise by this label
      dplyr::mutate(Top10 = ifelse({{ var }} <= max_quantile, "Top10", "Other")) |>
      janitor::tabyl({{higher_level_geography}}, .data$Top10) |>

      # Calculate proportion of most deprived LSOAs
      dplyr::mutate(Proportion = .data$Top10 / (.data$Top10 + .data$Other)) |>
      dplyr::select({{ higher_level_geography }}, .data$Proportion) |>
      tibble::as_tibble()
  }
