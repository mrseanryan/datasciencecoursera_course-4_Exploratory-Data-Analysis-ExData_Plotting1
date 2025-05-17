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

# We only need data from the dates 2007-02-01 and 2007-02-02
load_data_for_given_dates <- function() { 
  data_dir <- "./temp"
  data_filename <- "household_power_consumption.zip"
  dest_file <- download_if_missing(data_dir, data_filename, data_url)

  print_section("Loading data")

  path_to_csv <- paste(data_dir, "household_power_consumption.txt", sep = "/")

  if (!file.exists(path_to_csv)) {
    unzip(dest_file, exdir = data_dir)
  }
  list.files(data_dir)

  data <- read.csv(path_to_csv, sep = ";", header = TRUE, na.strings = "?")
  # Convert 'Date' column to Date type
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  # Subset data for 2007-02-01 and 2007-02-02
  subset_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

  invisible(subset_data)
}
