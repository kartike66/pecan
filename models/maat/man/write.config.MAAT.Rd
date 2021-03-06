% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write.config.MAAT.R
\name{write.config.MAAT}
\alias{write.config.MAAT}
\title{Write MAAT model configuration files}
\usage{
write.config.MAAT(defaults = NULL, trait.values, settings, run.id)
}
\arguments{
\item{defaults}{list of defaults to process}

\item{settings}{list of settings from pecan settings file}

\item{run.id}{id of run}

\item{trait.samples}{vector of samples for a given trait}
}
\value{
configuration file for MAAT for given run
}
\description{
Writes a MAAT config file.
}
\details{
Requires a pft xml object, a list of trait values for a single model run,
and the name of the file to create
}
\author{
Shawn Serbin, Anthony Walker, Rob Kooper, Chris Black
}
