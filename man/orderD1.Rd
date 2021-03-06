% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helperMisc.R
\name{orderD1}
\alias{orderD1}
\title{Order Dimension 1}
\source{
\url{http://stackoverflow.com/q/32000387/2343633}
}
\usage{
orderD1(x, ord)
}
\arguments{
\item{x}{an array}

\item{ord}{vector indicating the order of the elements; for format, see \code{\link{order}}}
}
\value{
a reordered array
}
\description{
Reorder the first dimension of array
}
\details{
This function is only useful if you don't know the total number of dimensions in the array; if the total number of dimensions are known, it is much faster to simply do \code{x[ord,,]} (for 3d array).
}
\section{Note}{

This function is slow, and there are several alternatives that are far faster. Future versions of the function will upgrade to those. See examples for timings, but note that the faster alternatives do not contain any checks, which adds to their advantage.
}
\examples{
arr <- array(1:240, dim=c(40,3,2))
orderD1(arr, 40:1)
arr[40:1,,]

\donttest{

# first alternative
# can be even faster if ls0 is allowed to be moved outside
# if it can be, is fastest
od1 <- function(x, ord){
	ls0 <- list(substitute(x[])[[3]])
	do.call(`[`,c(list(x,ord),rep(ls0,length(dim(x))-1)))
}

# second alternative
tlm <- function(x, ord){
	do.call(`[`,c(list(x,ord),rep(TRUE,length(dim(x))-1)))
}

# library(microbenchmark)
# microbenchmark(arr[40:1,,], orderD1(arr, 40:1), od1(arr, 40:1), tlm(arr, 40:1), times=1E3)

# Unit: microseconds
#                expr    min      lq      mean  median      uq     max neval  cld
#       arr[40:1, , ]  3.287  3.7565  4.318502  3.9240  4.1425 183.473  1000 a
#  orderD1(arr, 40:1) 24.595 26.6875 28.706691 27.3930 28.5110 191.236  1000    d
#      od1(arr, 40:1)  8.480  9.5665 10.383376 10.1195 10.6590  55.539  1000   c
#      tlm(arr, 40:1)  7.431  8.3760  8.994415  8.8275  9.3100  20.897  1000  b
}

}

