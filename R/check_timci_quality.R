#' Detect submission not submitted on the day they were started (ODK function)
#'
#' @param df dataframe containing any ODK data, assuming standard metadata fields (`start`, `end`) are present.
#' @return This function returns a dataframe containing the duration between start and end
#' @export
#' @import dplyr magrittr

detect_submission_duration <- function(df) {

  # To be defined

}

#' Detect ID duplicates (TIMCI-specific function)
#'
#' @param df dataframe containing the processed facility data
#' @return This function returns a dataframe containing unique IDs and their frequencies (a frequency strictly superior to 1 indicates a duplicate).
#' @export
#' @import dplyr magrittr

detect_id_duplicates <- function(df) {

  res <- data.frame(table(df$child_id))
  rescols <- colnames(res)
  if ('Var1' %in% rescols) {
    res <- res %>%
      dplyr::rename(child_id = Var1,
                    id_fq = Freq)
  }

}

#' Detect name duplicates (TIMCI-specific function)
#' Search for exact matches and switches
#'
#' @param df dataframe containing the processed facility data
#' @return This function returns a dataframe containing IDs and names of duplicate names
#' @export
#' @import dplyr magrittr

detect_name_duplicates <- function(df) {

  # Exact (case-insensitive) duplicates
  df <- dplyr::mutate(df, full_name = tolower(paste(fs_name, ls_name, sep = ' ')))
  df1 <- df[c("child_id", "full_name")]
  qc1 <- data.frame(table(df1$full_name))
  qc1 <- qc1 %>%
    dplyr::rename(full_name = Var1,
                  ex_name_fq = Freq)
  qc <- merge(df1, qc1, by = 'full_name')

  # Switched (case-insensitive) names
  df <- dplyr::mutate(df, switched_name = tolower(paste(ls_name, fs_name, sep = ' ')))
  df2 <- df[c("child_id", "full_name", "switched_name")]
  df2a <- df2[c("child_id", "full_name")] %>%
    dplyr::rename(name = full_name)
  df2b <- df2[c("child_id", "switched_name")] %>%
    dplyr::rename(name = switched_name)
  df2 <- rbind(df2a, df2b)
  qc2 <- data.frame(table(df2$name))
  qc2 <- qc2 %>%
    dplyr::rename(switched_name = Var1,
                  sw_name_fq = Freq)
  qc <- merge(qc, qc2, by.x = 'full_name', by.y = 'switched_name')

  # Approximate String Matching (Fuzzy Matching)
  #df3 <- df[c("child_id", "full_name")]
  #qc3 <- df3[lapply(car.vins, agrep, x = vin.vins, max.distance = c(cost=2, all=2), value = TRUE)
           #, .(NumTimesFound = .N)
           #, by = df1$full_name]
  #qc <- merge(qc, qc3, by.x = 'full_name', by.y = 'switched_name')

  qc %>% dplyr::select(child_id, ex_name_fq, sw_name_fq)

}

#' Detect name and date of birth duplicates (TIMCI-specific function)
#'
#' @param df dataframe containing the processed facility data
#' @return This function returns a vector containing IDs of duplicate name
#' @export
#' @import dplyr magrittr

detect_namedob_duplicates <- function(df) {

  #To be defined

}

#' Detect inconsistent dates (TIMCI-specific function)
#'
#' @param df dataframe containing the processed facility data
#' @return This function returns a dataframe containing data of possible duplicate participants only
#' @export
#' @import dplyr magrittr

detect_inconsistent_dates <- function(df) {

  # To complete

}

# Same patient ID from different facilities
# First name is not consistent
# First name match is below … %
# First name match is below … %, while taking into account local phonetic variability
# Last name is not consistent
# First and last names are switched
# Middle name is not consistent
# Sex is not consistent
# Year of birth is not consistent
# Month of birth is not consistent
# Day of birth is not consistent
# Month and day of birth are switched
# Identity score is below … %

#Baseline visit identification
#New visit anterior to last visit received
