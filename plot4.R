source("utils.download_data.R")
source("utils.print.R")

# load_data_for_given_dates() loads the data for the given dates:
data_1 <- load_data_for_given_dates()

# Tidy the data:
# - Avoid missing values (?)
# - Convert the Date and Time variables to Date/Time classes in R using strptime(), as.Date().
# - Drop na
data_1 <- tidy_data(data_1)

str(data_1)
head(data_1)

print_section("Plotting plot 4 - 4 Plots")

# plot4 = TL=plot2. BL= plot3.
# - TR = line, Voltage vs datetime
# - BR = line, Global reactive power vs datetime
