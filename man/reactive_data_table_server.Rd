% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/display_data_table_module.R
\name{reactive_data_table_server}
\alias{reactive_data_table_server}
\title{Reactive data table module server-side processing}
\usage{
reactive_data_table_server(id, vars)
}
\arguments{
\item{id}{character used to specify namespace, see \code{shiny::\link[shiny]{NS}}}

\item{vars}{parameter containing a reactive list with the following components:
\describe{
  \item{`citem`}{string indicating the current ODK form}
  \item{`cdata`}{dataframe containing the current ODK data}
}}
}
\description{
This module displays the ODK data table corresponding to the form selected by the user.
}
