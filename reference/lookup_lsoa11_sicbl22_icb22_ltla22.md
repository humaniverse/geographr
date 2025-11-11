# LSOA (2011) to SICBL (2022) to ICB (2022) to LTLA (2022) Lookup

A data set containing a lookup between 2011 LSOAs, 2022 Sub ICB
Locations, 2022 IBCs and 2022 LTLAs in England.

## Usage

``` r
lookup_lsoa11_sicbl22_icb22_ltla22
```

## Format

A data frame of class "tbl" with 32,844 rows and 10 variables:

- lsoa11_name:

  LSOA 2011 name

- lsoa11_code:

  LSOA 2011 code

- sicbl22_name:

  Sub ICB Location 2022 name

- sicbl22_code:

  Sub ICB Location code 2022 (retains former CCG codes)

- sicbl22_code_h:

  Sub ICB Location code 'h' 2022 (retains former CCG codes)

- icb22_name:

  ICB 2022 name

- icb22_code:

  ICB 2022 code (retains former ICS/STP codes)

- icb22_code_h:

  ICB 2022 code 'h' (retains former ICS/STP codes)

- ltla22_name:

  LTLA 2022 name

- ltla22_code:

  LTLA 2022 code

## Source

<https://geoportal.statistics.gov.uk/>
