#' Format ODK metadata
#'
#' @param df dataframe containing the non de-identified (raw) ODK data, assuming standard metadata fields (`today`, `start`, `end`) are present.
#' @return This function returns a formatted dataframe for future display and analysis.
#' @export
#' @import magrittr dplyr

format_odk_metadata <- function(df) {

  if (dim(df)[1] > 0) {
    df$today <- strftime(df$today,"%Y-%m-%d")
    df$duration <- as.integer(round(df$end - df$start, digits = 0))
    df$start <- strftime(df$start,"%T")
    df$end <- strftime(df$end,"%T")
    df %>% dplyr::rename('date' = 'today')
  }

}

#' # Unzip and extract data from ODK zip
#'
#' @param odk_zip absolute path to the zip file named "`fid`.zip" containing ODK submissions as CSV, plus separate CSVs for any repeating groups, plus any attachments in a subfolder `media`
#' @param csv_name name of the .CSV file
#' @return This function returns a formatted dataframe for future display and analysis.
#' @export
#' @import magrittr dplyr readr utils fs

extract_data_from_odk_zip <- function(odk_zip, csv_name) {

  t <- tempdir()
  utils::unzip(odk_zip, exdir = t)
  fs::dir_ls(t)
  raw_odk_data <- file.path(t, csv_name) %>%
    readr::read_csv()
  format_odk_metadata(raw_odk_data)

}

#' Format multiple select answers so as to separate them
#'
#' @param df dataframe containing ODK data
#' @param cols list of column names
#' @param sep separator, e.g. ";" "," etc
#' @return This function returns a dataframe with multiple answers separated by `sep`.
#' @export
#' @import stringr

format_multiselect_asws <- function(df, cols, sep) {

  # Replace the space between different answers by `sep` in multiple select questions
  for (i in cols) {
    df[[i]] <- stringr::str_replace_all(df[[i]], " ", sep)
  }
  df

}
