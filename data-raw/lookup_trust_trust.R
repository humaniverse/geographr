# Load libraries
library(tidyverse)
library(devtools)
library(httr)
library(readxl)
library(lubridate)

load_all()

# The "Successor Organisation" and "Archived Successor Organisations" document
# Trust changes. The former covering the past financial year, and the latter all
# historic changes before that.
successor_query <-
  query_urls |>
  filter(id == "trust_trust_successor") |>
  pull(query)

# Load successor data
GET(
  successor_query,
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())

successor_raw <-
  read_csv(
    list.files(
      tempdir(),
      pattern = "succ.csv",
      full.names = TRUE
    ),
    col_names = c(
      "old_code",
      "new_code",
      "R",
      "date",
      "blank"
    )
  )

successor <-
  successor_raw %>%
  select(
    old_code,
    new_code,
    date
  )

successor_archived_query <-
  query_urls |>
  filter(id == "trust_trust_successor_archived") |>
  pull(query)

# Load Archived Successor Organisations
GET(
  successor_archived_query,
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())

successor_archived_raw <-
  read_csv(
    list.files(
      tempdir(),
      pattern = "succarc.csv",
      full.names = TRUE
    ),
    col_names = c(
      "old_code",
      "new_code",
      "R",
      "date",
      "blank"
    )
  )

successor_archived <-
  successor_archived_raw %>%
  select(
    old_code,
    new_code,
    date
  )

# Join all trust changes (note the data also contains non trusts)
trust_changes <-
  bind_rows(
    successor,
    successor_archived
  )

lookup_trust_trust <-
  trust_changes |>
  mutate(date = ymd(date))

usethis::use_data(lookup_trust_trust, overwrite = TRUE)
