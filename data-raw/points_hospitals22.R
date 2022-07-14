# ---- Load libs ----
library(tidyverse)
library(sf)
library(lobstr)
library(httr)
library(xml2)
library(rvest)
library(tidygeocoder)

# ---- Scrape a list of hospitals ----
# The code block between the *** comes from: https://github.com/matthewgthomas/nhs-scraper/

# *****************************************************************************
##
## URLs
##
# url_trusts_list = "https://www.nhs.uk/servicedirectories/pages/nhstrustlisting.aspx"
url_trusts_list_acute <- "https://www.nhs.uk/Services/Pages/AcuteTrustList.aspx?trustType=Acute"
url_trusts_list_other <- "https://www.nhs.uk/Services/Pages/AcuteTrustList.aspx?trustType=HealthAndCare"

url_trusts <- "https://www.nhs.uk/Services/Trusts/HospitalsAndClinics/DefaultView.aspx"

# set user agent
ua <- httr::user_agent("https://redcross.org.uk")

# a couple of helper functions just to make the code neater
extract_html <- function(x) {
  doc %>%
    html_nodes(xpath = x)
}

extract_text <- function(x) {
  extract_html(x) %>%
    html_text()
}


################################################################################################
## Download list of Trust IDs
##
scrape_trusts_list <- function(url) {
  # get webpage data
  req <- httr::GET(url, ua)

  # load html
  out <- content(req, "text")
  doc <- read_html(out)

  # get list of links to Trusts' webpages
  trusts_list <- doc %>%
    html_nodes(xpath = "//*[contains(@class, 'o-listing')]//a/@href") %>% # get href of any <a> tags within anything that has the class "trust-list"
    html_text()

  trusts_list <- str_extract(trusts_list, "id=[0-9]+") # extract the IDs for each Trust
  trusts_list <- na.omit(trusts_list) # remove NAs (these are the 'return to top' links)
  trusts_list
}

trusts_list_acute <- scrape_trusts_list(url_trusts_list_acute)
trusts_list_other <- scrape_trusts_list(url_trusts_list_other)

trusts_list <- c(trusts_list_acute, trusts_list_other)

rm(trusts_list_acute, trusts_list_other)


################################################################################################
## Scrape hospital addresses and URLs for each Trust, as well as Trust reviews
##
# loop over each Trust, extracting hospital data
all_hospitals <- tibble()
all_trusts <- tibble()
i <- 1

for (trust in trusts_list) {

  # get Trust webpage data
  req <- httr::GET(modify_url(url_trusts, query = trust), ua)

  # load html
  out <- content(req, "text")
  doc <- read_html(out)

  trust_name <- extract_text(".//h1[@id = 'org-title']")

  trust_address1 <- extract_text(".//span[@property = 'streetAddress']")
  trust_address2 <- extract_text(".//span[@property = 'addressLocality']")
  trust_address3 <- extract_text(".//span[@property = 'addressRegion']")
  trust_pc <- extract_text(".//span[@property = 'postalCode']")
  trust_web <- extract_text(".//a[@property = 'url']")

  trusts <- tibble(Name = trust_name, Address1 = trust_address1, Address2 = trust_address2, Address3 = trust_address3, Postcode = trust_pc, URL = trust_web)

  ##
  ## get hospital details from this Trust
  ##
  hosp_names <- extract_text(".//*[contains(@class, 'hospital-list')]//*//h3//a")
  hosp_urls <- extract_text(".//*[contains(@class, 'hospital-list')]//*//h3//a/@href")
  hosp_address <- as.character(extract_html(".//*[contains(@class, 'hospital-list')]//*//dd[@class = 'addrss']")) # keep html for address

  hosp_address <- hosp_address[1:length(hosp_names)]

  hospitals <- tibble(Name = hosp_names, URL = hosp_urls, Address = hosp_address, Trust = trust_name)

  # tidy up addresses:
  hospitals <- hospitals %>%
    mutate(Address = str_replace_all(Address, "<br>", ", ")) %>% # replace <br> with ", "
    mutate(Address = str_replace_all(Address, "<[^>]*>", "")) %>% # remove other html tags
    mutate(Address = str_replace_all(Address, "\\n", ""))

  # extract postcodes
  # regular expression to match postcodes (allowing lowercase and unlimited spaces)
  # source: https://stackoverflow.com/a/7259020
  # see also: page 6 of https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/488478/Bulk_Data_Transfer_-_additional_validation_valid_from_12_November_2015.pdf
  postcode_regex <- "(([gG][iI][rR] {0,}0[aA]{2})|((([a-pr-uwyzA-PR-UWYZ][a-hk-yA-HK-Y]?[0-9][0-9]?)|(([a-pr-uwyzA-PR-UWYZ][0-9][a-hjkstuwA-HJKSTUW])|([a-pr-uwyzA-PR-UWYZ][a-hk-yA-HK-Y][0-9][abehmnprv-yABEHMNPRV-Y]))) {0,}[0-9][abd-hjlnp-uw-zABD-HJLNP-UW-Z]{2}))"

  hospitals <- hospitals %>%
    mutate(Postcode = str_extract(Address, postcode_regex))

  # save to main dataframe
  all_trusts <- bind_rows(all_trusts, trusts)
  all_hospitals <- bind_rows(all_hospitals, hospitals)

  print(paste0("Finished ", i, " of ", length(trusts_list)))
  i <- i + 1

  Sys.sleep(0.75) # scrape responsibly with a pause between requests
} # end for
# *****************************************************************************

# ---- Geocode hospital postcodes ----
geocoded_hospitals <-
  all_hospitals |>
  select(hospital_name = Name, postcode = Postcode) |>
  geocode(
    postalcode = postcode,
    method = "osm"
  )

# ---- Convert to sf object ----
sf_hospitals <-
  geocoded_hospitals |>
  drop_na() |>
  st_as_sf(coords = c("long", "lat"), crs = 4326)

# Make sure geometries are valid
sf_hospitals <- st_make_valid(sf_hospitals)

# ---- Clean ----
# Check geometry types are homogenous
if (sf_hospitals |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}

if (sf_hospitals |>
  st_geometry_type() |>
  unique() != "POINT") {
  stop("Incorrect geometry types")
}

# Check object is below 50Mb GitHub warning limit
if (obj_size(sf_hospitals) > 50000000) {
  stop("File is too large")
}

hospitals_select <-
  sf_hospitals |>
  select(hospital22_name = hospital_name)

# Rename
points_hospitals22 <- hospitals_select

# Save output to data/ folder
usethis::use_data(points_hospitals22, overwrite = TRUE)