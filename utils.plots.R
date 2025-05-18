redirect_plots_to_png <- function(png_file, width = 480, height = 480) {
  # Output = png, 480x480 pixels.
  png(png_file, width = width, height = height)
}

save_plots_to <- function(plot_file) {

  # Output the plot to the file name
  dev.off() # close the device
  cat("Plots saved to:", plot_file, "\n")
}
