source("utils.download_data.R")
source("utils.print.R")

data_1 <- load_data_for_given_dates()
head(data_1)

print_section("Plotting plot 3 - Energy sub metering vs Day")

# plot3 = line, Energy sub metering 1 [black] vs Day
# sub_metering_2 - red
# sub_metering_3 - blue
