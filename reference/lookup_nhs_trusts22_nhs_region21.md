# NHS Trusts (February 2022) to NHS Regions (April 2021) Lookup

A data set containing February 2022 NHS Trusts and their associated
names, codes, and open status, with a lookup to NHS Regions (April
2021).

## Usage

``` r
lookup_nhs_trusts22_nhs_region21
```

## Format

A data frame of class "tbl" with 214 rows and 6 variables:

- nhs_trust22_code:

  NHS Trust code

- nhs_trust22_name:

  NHS Trust name

- nhs_region21_nhs_code:

  NHS Region code (NHS version)

- nhs_region21_ons_code:

  NHS Region code (ONS version)

- nhs_region21_name:

  NHS Region name

- status:

  whether the Trust is 'open' or 'closed'

## Source

<https://digital.nhs.uk/>
