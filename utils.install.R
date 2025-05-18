is_installed <- function(pkg) {
  nzchar(system.file(package = pkg))
}

get_alt_install_dir_to_avoid_permissions_issue <- function() {
  # get around permissions issues (Windows)
  path_to_lib_dir <- paste("temp", "lib", sep = "/")
  if (!dir.exists(path_to_lib_dir)) {
    dir.create(path_to_lib_dir)
  }
  .libPaths(path_to_lib_dir)
  return(path_to_lib_dir)
}

install_if_missing <- function(package_name) {
  print(paste("Checking for ", package_name))
  path_to_lib_dir <- get_alt_install_dir_to_avoid_permissions_issue()

  if (!require(package_name) && !is_installed(package_name)) {
    print(paste("Installing ", package_name))
    r_mirror_nl <- "https://mirrors.evoluso.com/CRAN/"

    install.packages(package_name, repos = r_mirror_nl, lib = path_to_lib_dir)
  }
}
