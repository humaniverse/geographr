# NHS Scotland Hopsitals (2024)

A data set containing 2024 NHS Scotland hospital point geometries (i.e.,
lat/long coordinates) and their associated names and addresses. Note
that this data set contains the 14 standard regional boards, plus three
additional special boards as described at
<https://www.scot.nhs.uk/organisations/>.

## Usage

``` r
points_scotland_hospitals24
```

## Format

A data frame of class "sf" with 309 rows and 7 variables:

- scotland_hospital24_code:

  NHS Scotland hospital code

- scotland_hospital24_name:

  NHS Scotland hospital name

- hb19_code:

  Health Board code

- hb19_name:

  Health Board name

- postcode:

  Postcode

- address:

  Address

- geometry:

  point coordinates

## Source

<https://data.spatialhub.scot/>
