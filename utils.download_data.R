source("utils.install.R")

install_if_missing("data.table")
install_if_missing("hms")

# Load the data
data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download_if_missing <- function(data_dir, data_filename, data_url) {
  print_section("Downloading data")
  if (!file.exists(data_dir)) {
    dir.create(data_dir)
  }
  dest_file <- paste(data_dir, data_filename, sep = "/")

  if (file.exists(dest_file)) {
    print("File already downloaded!")
  } else {
    download.file(data_url, destfile = dest_file, method = "curl") # curl helps with https (on Mac)
  }
  list.files(data_dir)

  print(paste("dest_file: ", dest_file))

  return(dest_file)
}

load_data_for_given_dates <- function(dates = c("1/2/2007", "2/2/2007")) { 
  data_dir <- "./temp"
  data_filename <- "household_power_consumption.zip"
  dest_file <- download_if_missing(data_dir, data_filename, data_url)

  print_section("Loading data")

  path_to_csv <- paste(data_dir, "household_power_consumption.txt", sep = "/")

  if (!file.exists(path_to_csv)) {
    unzip(dest_file, exdir = data_dir)
  }
  list.files(data_dir)
 
  # Load data - pre-filter for efficiency.
  library(data.table)
  dt1 <- fread(path_to_csv, sep = ";", na.strings = "?")

  # Filter to specific dates
  dt1 <- dt1[Date %in% dates]

  invisible(dt1)
}

tidy_data <- function(dt1) { 
  # Convert the Date and Time variables to Date/Time classes in R using strptime(), as.Date().
  # - Convert the 'Date' column to a Date type
  dt1$Date <- as.Date(dt1$Date, format = "%d/%m/%Y")
  # - Convert Time column - use hms so it does not include the date
  library(hms)
  dt1$Time <- as_hms(dt1$Time)

  invisible(dt1)
}
