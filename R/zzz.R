.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    paste0(
      "The geographr package contains open source data.\n",
      "The licenses and terms of the data can be found in the link below:\n",
      "https://github.com/britishredcrosssociety/geographr/blob/main/LICENSE"
    )
  )
}