dm_main <- function(file_name) {
  # Read main table
  d_main <-  readxl::read_excel(file_name, sheet = 1)

  # Normalize var names
  names(d_main) <- alg_make_clean_names(names(d_main))

  # logicals characters to logicals
  lgcls <- vapply(d_main, alg_is_char_logical, logical(1))
  d_main[lgcls] <- lapply(d_main[lgcls], alg_as_logical_char_logical)

  # dates to date
  # df_main <-
  #   df_main %>%
  #   mutate(across(
  #     starts_with("date_"),
  #     ~ lubridate::ymd(.x)
  #   ))

  # Data ingeneering

  d_main
}
