source("utils.download_data.R")
source("utils.print.R")

data_1 <- load_data_for_given_dates()
head(data_1)

print_section("Plotting plot 4 - 4 Plots")

# plot4 = TL=plot2. BL= plot3.
# - TR = line, Voltage vs datetime
# - BR = line, Global reactive power vs datetime
