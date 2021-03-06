% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_timci_quality.R
\name{detect_submission_duration}
\alias{detect_submission_duration}
\title{Detect submission not submitted on the day they were started (ODK function)}
\usage{
detect_submission_duration(df)
}
\arguments{
\item{df}{dataframe containing any ODK data, assuming standard metadata fields (`start`, `end`) are present.}
}
\value{
This function returns a dataframe containing the duration between start and end
}
\description{
Detect submission not submitted on the day they were started (ODK function)
}
