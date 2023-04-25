library(targets)

source("R/_packages.R")  # Load your packages, e.g. library(drake).
source("R/_functions.R") # Define your custom code as a bunch of functions.
future::plan("multicore", workers = 4)

list(
  tar_target(d_main_file, "data/input/data.xlsx", format = "file"),
  tar_target(d_main, dm_main(d_main_file)),
  tar_target(data_bases, list(main = d_main)),
  tar_target(data_bases_names, names(data_bases)),
  tar_target(exp_cols,
    NULL
    # c("some", "other", "stuff")
  ),
  # simple briefing
  tar_target(briefing,
    briefr::brf_describe(
      d_main,
      groupings = exp_cols,
      na.rm = FALSE,
      output_dir = "data/output",
      output_filename = "description_main.html"
    )
  ),
  # # briefing for all bases in `data_bases`
  # tar_target(briefing,
  #   briefr::brf_describe(
  #     data_bases[[1]],
  #     groupings = exp_cols,
  #     na.rm = FALSE,
  #     output_dir = "data/output",
  #     output_filename = paste0("description_", data_bases_names, ".html")
  #   ),
  #   pattern = map(data_bases, data_bases_names),
  # ),

  # tarchetypes::tar_render_rep(
  #   md_report,
  #   "Rmd/main_nb.Rmd",
  #   params = tibble(
  #     output_file = paste0("analysis_", names(data_bases)),
  #     d_main = data_bases
  #   ),
  #   output_dir = "data/output"
  # ),
  # tarchetypes::tar_render(
  #   md_report,
  #   "Rmd/main_nb.Rmd",
  #   output_dir = "data/output",
  #   output_file = "main_analysis.html"
  # ),
  tar_target(last_line, TRUE)
)
