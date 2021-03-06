% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/pvisgam.R
\name{pvisgam}
\alias{pvis.gam}
\alias{pvisgam}
\title{Visualization of nonlinear interactions.}
\usage{
pvisgam(x, view = NULL, select = NULL, cond = list(), n.grid = 30,
  too.far = 0, col = NA, color = "topo", contour.col = NULL,
  add.color.legend = TRUE, se = -1, type = "link",
  plot.type = "contour", zlim = NULL, xlim = NULL, ylim = NULL,
  nCol = 50, labcex = 0.6, hide.label = FALSE,
  print.summary = getOption("itsadug_print"), dec = -1, ...)
}
\arguments{
\item{x}{A gam object, produced by \code{\link[mgcv]{gam}} or
\code{\link[mgcv]{bam}}.}

\item{view}{A two-value vector containing the names of the two main effect
terms to be displayed on the x and y dimensions of the plot. Note that
variables coerced to factors in the model formula won't work as view
variables.}

\item{select}{A number, selecting a single model term for printing. e.g.
if you want the plot for the second smooth term set select=2.}

\item{cond}{A named list of the values to use for the other predictor terms
(not in view). Used for choosing between smooths that share the same view
predictors.}

\item{n.grid}{The number of grid nodes in each direction used for
calculating the plotted surface.}

\item{too.far}{Plot grid nodes that are too far from the points defined by
the variables given in view can be excluded from the plot. too.far
determines what is too far. The grid is scaled into the unit square along
with the view variables and then grid nodes more than too.far from the
predictor variables are excluded.}

\item{col}{The colors for the facets of the plot.}

\item{color}{The color scheme to use for plots. One of "topo", "heat",
"cm", "terrain", "gray" or "bw".}

\item{contour.col}{sets the color of contours when using plot.}

\item{add.color.legend}{Logical: whether or not to add a color legend.
Default is TRUE. If FALSE (omitted), one could use the function
\code{\link{gradientLegend}} to add a legend manually at any position.}

\item{se}{If less than or equal to zero then only the predicted surface is
plotted, but if greater than zero, then 3 surfaces are plotted, one at the
predicted values minus se standard errors, one at the predicted values and
one at the predicted values plus se standard errors.}

\item{type}{"link" to plot on linear predictor scale and "response" to plot
on the response scale.}

\item{plot.type}{one of "contour" or "persp" (default is "contour").}

\item{zlim}{A two item array giving the lower and upper limits for the z-
axis scale. NULL to choose automatically.}

\item{xlim}{A two item array giving the lower and upper limits for the x-
axis scale. NULL to choose automatically.}

\item{ylim}{A two item array giving the lower and upper limits for the y-
axis scale. NULL to choose automatically.}

\item{nCol}{The number of colors to use in color schemes.}

\item{labcex}{Size of the contour labels.}

\item{hide.label}{Logical: whether or not to hide the label
(i.e., "partial effect"). Default is FALSE.}

\item{print.summary}{Logical: whether or not to print summary.
Default set to the print info messages option
(see \code{\link{infoMessages}}).}

\item{dec}{Numeric: number of decimals for rounding the color legend.
If -1 (default), automatically determined. When NULL, no rounding.
Note: if value = -1 (default), rounding will be applied also when
\code{zlim} is provided.}

\item{...}{other options to pass on to persp, image or contour. In
particular ticktype="detailed" will add proper axes labeling to the plots.}
}
\description{
Produces perspective or contour plot views of gam model
predictions of the partial effects interactions. Combines the function
\code{\link[mgcv]{plot.gam}} for interaction surfaces with the function
\code{\link[mgcv]{vis.gam}}. Similar to \code{\link[mgcv]{plot.gam}},
\code{pvisgam} plots the partial interaction surface, without including
values for other predictors that are not being shown. Similar to
\code{\link[mgcv]{vis.gam}} the user can set the two predictors to be
viewed, and colors are added behind the contours to facilitate
interpretation. In contrast to \code{\link[mgcv]{plot.gam}}, this function
allows to plotting of interactions with three of more continuous predictors
by breaking it down in two-dimensional surfaces.
The code is derivated from the script for \code{\link[mgcv]{vis.gam}}.
}
\section{Warnings}{

In contrast to vis.gam, do not specify other predictors in \code{cond} that
are not to be plotted.
}
\examples{
data(simdat)

\dontrun{
# Model with random effect and interactions:
m1 <- bam(Y ~ te(Time, Trial)+s(Time, Subject, bs='fs', m=1),
    data=simdat)

# Plot summed effects:
vis.gam(m1, view=c("Time", "Trial"), plot.type='contour', color='topo')
# Partial effect of interaction:
pvisgam(m1, view=c("Time", "Trial"), select=1)
# Same:
plot(m1, select=1, scheme=2)
plot(m1, select=1)
# Alternatives:
pvisgam(m1, view=c("Trial", "Time"), select=1)
pvisgam(m1, view=c("Trial", "Time"), select=1, zlim=c(-20,20))

# Notes on the color legend:
# Labels can easily fall off the plot, therefore the numbers are
# automatically rounded.
# To undo the rounding, set dec=NULL:
pvisgam(m1, view=c("Time", "Trial"), dec=NULL)
# For custom rounding, set dec to a value:
pvisgam(m1, view=c("Time", "Trial"), dec=3)
# To increase the left marging of the plot (so that the numbers fit):
oldmar <- par()$mar
par(mar=oldmar + c(0,0,0,1) ) # add one line to the right
pvisgam(m1, view=c("Time", "Trial"), dec=3)
par(mar=oldmar) # restore to default settings

}
# see the vignette for examples:
vignette("overview", package="itsadug")
}
\author{
Jacolien van Rij. Modification of \code{\link[mgcv]{vis.gam}} from
package \code{\link[mgcv]{mgcv}} of Simon N. Wood.
}
\seealso{
\code{\link[mgcv]{vis.gam}}, \code{\link[mgcv]{plot.gam}}

Other functions for interpreting nonlinear effects: \code{\link{fvisgam}},
  \code{\link{vis.gam2}}; \code{\link{plotDiff2D}},
  \code{\link{plot_diff2}}; \code{\link{plotDiff}},
  \code{\link{plot_diff}}; \code{\link{plot_parametric}};
  \code{\link{plot_smooth}}; \code{\link{plot_topo}}
}

