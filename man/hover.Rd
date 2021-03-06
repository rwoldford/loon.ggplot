% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interactive-ggproto.R
\name{hover}
\alias{hover}
\title{Modify the \code{hover} component}
\usage{
hover(itemLabel = NULL, showItemLabels = NULL)
}
\arguments{
\item{itemLabel}{A character vector of length \code{n} with a string to be used to pop up when the
mouse hovers above that element.}

\item{showItemLabels}{A single logical value: \code{TRUE} if pop up labels are to appear on hover,
\code{FALSE} (the default) if they are not.}
}
\value{
a \code{ggproto} object
}
\description{
Provides a pop up display as the mouse hovers over a plot element in the interactive plot.
}
\examples{
if(interactive()) {

  l_ggplot(mpg, mapping = aes(x = displ, y = cty)) +
    geom_point(size = 4) +
    # push the states of scatter plot to the histogram
    hover(itemLabel =
       with(mpg,
            paste0("model: ", manufacturer, " ", model, "\n",
                   "year: ", year, "\n",
                   "drive way: ", drv, "\n",
                   "fuel type: ", fl)
       ),
       showItemLabels = TRUE
    )
    # hover the mouse on top of any point to query
}
}
\seealso{
\code{\link{active}}, \code{\link{linking}}, \code{\link{zoom}},
\code{\link{selection}}, \code{\link{interactivity}}
}
