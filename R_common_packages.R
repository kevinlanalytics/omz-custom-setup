common_cran_packages <- c(
  "tidyverse",
  "data.table",
  "brio",
  "cachem",
  "cli",
  "desc",
  "devtools",
  "digest",
  "dplyr",
  "ellipsis",
  "farver",
  "fastmap",
  "fs",
  "generics",
  "ggplot2",
  "glue",
  "gtable",
  "hms",
  "htmltools",
  "htmlwidgets",
  "httpuv",
  "later",
  "lifecycle",
  "magrittr",
  "memoise",
  "mime",
  "miniUI",
  "patchwork",
  "pillar",
  "pkgbuild",
  "pkgconfig",
  "pkgload",
  "profvis",
  "promises",
  "purrr",
  "R6",
  "RColorBrewer",
  "Rcpp",
  "readr",
  "remotes",
  "rlang",
  "rprojroot",
  "rstudioapi",
  "S7",
  "scales",
  "sessioninfo",
  "shiny",
  "testthat",
  "tibble",
  "tidyr",
  "tidyselect",
  "tzdb",
  "urlchecker",
  "usethis",
  "vctrs",
  "withr",
  "xtable",
  "installr"
)

common_github_packages <- c(
  "stufield/helpr",
  "stufield/wranglr"
)

if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}

if (!requireNamespace("renv", quietly = TRUE)) {
  stop("The 'renv' package is required but could not be installed.")
}

renv::install(common_cran_packages)
renv::install(common_github_packages)
renv::snapshot()

