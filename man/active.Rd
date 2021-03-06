% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interactive-ggproto.R
\name{active}
\alias{active}
\title{Modify the \code{active} component}
\usage{
active(active = NULL, activeGeomLayers = NULL)
}
\arguments{
\item{active}{a logical or a logical vector of length \code{n} that determines which observations
are active (\code{TRUE} and hence appear in the plot) and which are inactive (\code{FALSE} and hence do not appear).
Default is \code{TRUE}.}

\item{activeGeomLayers}{determine which geom layer is interactive by its `geom_...` position in the grammar of the expression.
Currently, only \code{geom_point()} and \code{geom_histogram()} can be set as the active geom layer(s) so far.
(N.B. more than one \code{geom_point()} layer can be set as an active layer,
but only one \code{geom_histogram()} can be set as an active geom layer and it can be the only active layer.)}
}
\value{
a \code{ggproto} object
}
\description{
Set \code{active} and/or \code{activeGeomLayers}
}
\examples{
if(interactive()) {

  # set active layer
  l_ggplot(mtcars, aes(mpg, wt, shape = factor(cyl))) +
    geom_point(colour = "black", size = 4.5) +
    geom_point(colour = "pink", size = 4) +
    geom_point(aes(shape = factor(cyl))) +
    # only show manual transmission cars
    # in the second interactive layer
    active(active = mtcars$am == 1,
           activeGeomLayers = 2)

  # Then, click the `reactivate` button on loon inspector
  # to display all interactive points
}
}
\seealso{
\code{\link{linking}}, \code{\link{selection}}, \code{\link{zoom}},
\code{\link{hover}}, \code{\link{interactivity}}
}
