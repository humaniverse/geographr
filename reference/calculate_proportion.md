# Calculate proportion of small areas in the higher-level geography that are within the 10% most deprived areas in the nation.

Calculate proportion of small areas in the higher-level geography that
are within the 10% most deprived areas in the nation.

## Usage

``` r
calculate_proportion(data, var, higher_level_geography)
```

## Arguments

- data:

  Data frame containing a variable to be aggregated and a higher level
  geographical grouping variable

- var:

  Name of the variable in the data frame for which you want to calculate
  proportions. It must have only two possible values

- higher_level_geography:

  Name of the variable in the data frame containing the higher level
  geography names/codes

## Examples

``` r
if (FALSE) { # \dontrun{
  calculate_proportion(IMD::imd_england_lsoa, IMD_decile, msoa_code, n_people)
} # }
```
