% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plots.R
\name{generate_day_cumbar_plot}
\alias{generate_day_cumbar_plot}
\title{Create a cumulative daily bar plot}
\usage{
generate_day_cumbar_plot(
  date_vec1,
  lbl1,
  date_vec2,
  lbl2,
  date_min,
  date_max,
  ylim,
  ylbl = "Frequencies"
)
}
\arguments{
\item{date_vec1}{Vector #1 containing dates}

\item{lbl1}{Name of vector #1}

\item{date_vec2}{Vector #2 containing dates}

\item{lbl2}{Name of vector #1}

\item{date_min}{Start date of the plot}

\item{date_max}{End date of the plot}

\item{ylim}{Numeric vector of length 2 that contains the min and max values of the y-axis}

\item{ylbl}{String of the y-axis}
}
\value{
This function returns a ggplot object which contains a cumulative bar plot of frequencies by dates
}
\description{
generate_day_cumbar_plot() creates a bar plot.
}
