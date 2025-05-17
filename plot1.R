source("utils.download_data.R")
source("utils.print.R")

data_1 <- load_data_for_given_dates()
head(data_1)

print_section("Plotting plot 1 - Global Active Power vs Frequency")

# Convert the Date and Time variables to Date/Time classes in R using strptime(), as.Date().

# Avoid missing values (?)

# Use base plotting system.

# Output = png, 480x480 pixels.

# plot1 = hist, Global Active Power vs Frequency
