source("utils.download_data.R")
source("utils.print.R")

data_1 <- load_data_for_given_dates()
head(data_1)

print_section("Plotting plot 2 - Global Active Power vs Day")

# plot2 = line, Global Active Power vs Day
