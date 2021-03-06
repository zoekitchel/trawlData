% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean.names.R
\name{clean.names}
\alias{clean.names}
\title{Clean Names}
\usage{
clean.names(X, reg = c("ai", "ebs", "gmex", "goa", "neus", "newf", "ngulf",
  "sa", "sgulf", "shelf", "wcann", "wctri"))
}
\arguments{
\item{X}{a \code{data.table} containing trawl data}

\item{reg}{a region; should be one of the following: \code{c("ai","ebs","gmex","goa", "neus", "newf", "sa", "sgulf", "shelf", "wcann", "wctri")}}
}
\description{
Clean by standardizing the column names
}
\details{
Regions tend to have very different column names for what are essentiallythe same measurements, descriptors, etc. This function tries to give everything a standardized name when it's appropriate.
}
\seealso{
\code{\link{clean.names}}, \code{\link{clean.format}}, \code{\link{clean.columns}}, \code{\link{clean.tax}} \code{\link{clean.trimRow}}
}

