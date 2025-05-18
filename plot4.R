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

print_section("Plotting plot 4 - 4 Plots")

plot_filename <- "plot4.png"
redirect_plots_to_png(plot_filename)

# plot4 = TL=plot2. BL= plot3.
# - TR = line, Voltage vs datetime
# - BR = line, Global reactive power vs datetime

par(mfcol = c(2, 2))

data_1$datetime <- as.POSIXct(paste(data_1$Date, data_1$Time), format = "%Y-%m-%d %H:%M:%S")

unique_days <- as.Date(unique(data_1$datetime))
# Add one more day to the end, so have the 'end day'.
x_ticks <- as.POSIXct(c(unique_days, max(unique_days) + 1))
x_labels <- weekdays(x_ticks, abbreviate = TRUE)

# Use base plotting system.

# === top-left (plot2)
with(data_1, {
  plot(datetime, Global_active_power, type = "l",
       xlab = "Day",
       ylab = "Global Active Power (kilowatts)",
       main = "Daily Global Active Power",
       xaxt = "n" # custom x-axis tick labels
       )
  axis(1, at = x_ticks, labels = x_labels)
})

# === bottom-left (plot3)
with(data_1, {
  plot(datetime, Sub_metering_1, type = "l",
       xlab = "Day",
       ylab = "Energy sub metering (watt-hour)",
       main = "Daily Energy sub metering",
       xaxt = "n", # custom x-axis tick labels
       col = "black"
       )
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  axis(1, at = x_ticks, labels = x_labels)
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "blue", "red"), lty = 1,  
       bty = "n" # hide the legend border
       )
})

# === top-right
with(data_1, {
  plot(datetime, Voltage, type = "l",
       xlab = "Day",
       ylab = "Voltage (volts)",
       main = "Daily Voltage",
       xaxt = "n" # custom x-axis tick labels
       )
  axis(1, at = x_ticks, labels = x_labels)
})

# === bottom-right
with(data_1, {
  plot(datetime, Global_reactive_power, type = "l",
       xlab = "Day",
       ylab = "Global Reactive Power (kilowatts)",
       main = "Daily Global Reactive Power",
       xaxt = "n" # custom x-axis tick labels
       )
  axis(1, at = x_ticks, labels = x_labels)
})

# === Save the plot ===
save_plots_to(plot_filename)
