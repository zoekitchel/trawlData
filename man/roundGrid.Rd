% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/formatStrat.R
\name{roundGrid}
\alias{roundGrid}
\title{Round Grid}
\usage{
roundGrid(x, frac = 1)
}
\arguments{
\item{x}{numeric value to be rounded; can be a vector}

\item{frac}{numeric value representing the size of the grid}
}
\description{
Round values to snap to a fraction of a grid
}
\details{
If \code{frac} is 1, then round to the nearest whole number. If \code{frac} is 0.5, then snap everything to the nearest half a degree grid. If 10, then snap to the nearest multiple of 10, plus 5 (6 goes to 5, 8 goes to 5, 10 goes to 15, 21 goes to 25, etc). Handy if you have lat-lon data that you want to redefine as being on a grid.
}
\seealso{
\code{\link{ll2strat}}
}

