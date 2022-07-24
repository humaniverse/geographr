test_that("proportion calculation works", {
  test_data <-
    tibble::tribble(
      ~code, ~higher_geog, ~left_behind,
      1, 1, "yes",
      2, 1, "no"
    )

  test_data_proportions <-
    test_data |>
    calculate_proportion(left_behind, higher_geog)

  expect_equal(test_data_proportions$proportion_yes, 0.5)
})
