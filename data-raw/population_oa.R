library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Currently using mid-2019 estimates
# Source: https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datalist?sortBy=release_date&query=output%20area&filter=datasets&fromDateDay=&fromDateMonth=&fromDateYear=&toDateDay=&toDateMonth=&toDateYear=&size=10
# ONS publishes output area population estimates in separate files for each region
pop_urls <- c(
  # East Midlands
  "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fcensusoutputareaestimatesintheeastmidlandsregionofengland%2fmid2019sape22dt10f/sape22dt10fmid2019eastmidlands.zip",

  # North West
  "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fcensusoutputareaestimatesinthenorthwestregionofengland%2fmid2019sape22dt10b/sape22dt10bmid2019northwest.zip",

  # South East
  "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fcensusoutputareaestimatesinthesoutheastregionofengland%2fmid2019sape22dt10i/sape22dt10imid2019southeast.zip",

  # East
  "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fcensusoutputareaestimatesintheeastregionofengland%2fmid2019sape22dt10h/sape22dt10hmid2019east.zip",

  # West Midlands
  "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fcensusoutputareaestimatesinthewestmidlandsregionofengland%2fmid2019sape22dt10e/sape22dt10emid2019westmidlands.zip",

  # Wales
  "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fcensusoutputareaestimatesinwales%2fmid2019sape22dt10j/sape22dt10jmid2019wales.zip",

  # North East
  "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fcensusoutputareaestimatesinthenortheastregionofengland%2fmid2019sape22dt10d/sape22dt10dmid2019northeast.zip",

  # South West
  "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fcensusoutputareaestimatesinthesouthwestregionofengland%2fmid2019sape22dt10g/sape22dt10gmid2019southwest.zip",

  # Yorkshire and The Humber
  "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fcensusoutputareaestimatesintheyorkshireandthehumberregionofengland%2fmid2019sape22dt10c/sape22dt10cmid2019yorkshireandthehumber.zip",

  # London
  "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fcensusoutputareaestimatesinthelondonregionofengland%2fmid2019sape22dt10a/sape22dt10amid2019london.zip"
)

# Where to store the unzipped files temporarily
td <- tempdir()
unzip_dir <- file.path(td, "population-oa")

# Delete the temp folder if it already exists
if (dir.exists(unzip_dir))
  unlink(unzip_dir, recursive = TRUE)

# Download and upzip population estimates for each region
for (url in pop_urls) {
  GET(url, write_disk(tf <- tempfile(fileext = ".zip")))
  unzip(tf, exdir = unzip_dir)
  unlink(tf)
}

# Load population estimates
pop_files <- list.files(unzip_dir, full.names = T)
for (file in pop_files) {

  # if the merged dataset doesn't exist, create it
  if (!exists("oa_pop")){
    oa_pop <- read_excel(file, sheet = "Mid-2019 Persons", skip = 4) # %>%
      # select(OA11CD, LSOA11CD, `All Ages`)

  } else {
    # if the merged dataset does exist, append to it
    temp_dataset <- read_excel(file, sheet = "Mid-2019 Persons", skip = 4) # %>%
      # select(OA11CD, LSOA11CD, `All Ages`)

    oa_pop <- rbind(oa_pop, temp_dataset)
    rm(temp_dataset)
  }
}

oa_pop <-
  oa_pop %>%
  rename(
    oa_code = OA11CD,
    lsoa_code = LSOA11CD,
    total_population = `All Ages`
  )

population_oa = oa_pop

# Save output to data/ folder
usethis::use_data(population_oa, overwrite = TRUE)
