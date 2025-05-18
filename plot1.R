source("utils.download_data.R")
source("utils.plots.R")
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

print_section("Plotting plot 1 - Global Active Power vs Frequency")

plot_filename <- "plot1.png"
redirect_plots_to_png(plot_filename)

# Use base plotting system.

with(data_1, hist(
    Global_active_power, main="Global Active Power",
    col="red",
    xlab="Global Active Power (kilowatts)",
    ylab="Frequency"
))

save_plots_to(plot_filename)
