# England NHS Trusts (2022) to MSOA (2011) Lookup

A data set containing a lookup between 2022 England NHS Trusts and 2011
LSOA areas.

## Usage

``` r
lookup_nhs_trusts22_msoa11
```

## Format

A data frame of class "tbl" with 574,104 rows and 4 variables:

- msoa11_code:

  MSOA code

- nhs_trust22_code:

  NHS Trust code

- proportion_msoa_went_to_trust:

  The proportion of patients from all admissions from a given MSOA that
  went to a given Trust

- proportion_trust_came_from_msoa:

  The proportion of patients from all admissions from a given Trust that
  came from a given MSOA

## Source

<https://app.box.com/s/qh8gzpzeo1firv1ezfxx2e6c4tgtrudl>

## Details

The population size of an MSOA is much smaller than the population of
people who attend a given Trust. This means that the proportion of
patients from an MSOA that go to a Trust will be much higher than the
proprotion of patients from a Trust that came from an MSOA. This is
because Trusts serve many more MSOA's than MSOA patients go to different
trusts.

## Copyright reference

Office for Health Improvement & Disparities. NHS Acute (Hospital) Trust
Catchment Populations. 18.10.2022.
https://AcuteTrustCatchmentPopulation/app.powerbi.com © Crown copyright
2022
