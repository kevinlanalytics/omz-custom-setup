common_packages <- c(
  "tidyverse",
  "data.table",
  "readr",
  "ggplot2",
  "devtools"
)

if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}

if (!requireNamespace("renv", quietly = TRUE)) {
  stop("The 'renv' package is required but could not be installed.")
}

renv::install(common_packages)
renv::snapshot()

