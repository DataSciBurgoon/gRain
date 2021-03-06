% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grain-setcpt.R
\name{cpt-update}
\alias{cpt-update}
\alias{setCPT}
\alias{setCPT.cpt_grain}
\title{Update components of Bayesian network}
\usage{
setCPT(object, value)

\method{setCPT}{cpt_grain}(object, value)
}
\arguments{
\item{object}{A \code{grain} object.}

\item{value}{A named list, see examples below.}
}
\description{
Update components of Bayesian network.
}
\examples{
## See the wet grass example at
## https://en.wikipedia.org/wiki/Bayesian_network

yn <- c("yes", "no")
p.R <- cptable(~R, values=c(.2, .8), levels=yn)
p.S_R <- cptable(~S:R, values=c(.01, .99, .4, .6), levels=yn)
p.G_SR <- cptable(~G:S:R, values=c(.99, .01, .8, .2, .9, .1, 0, 1), levels=yn)

x <- compileCPT(p.R, p.S_R, p.G_SR)
x
wet.bn <- grain(x)

getgrain(wet.bn, "cpt")
getgrain(wet.bn, "cpt")$R
getgrain(wet.bn, "cpt")$S

# Now update some cpt's
wet.bn2 <- setCPT(wet.bn, list(R=c(.3, .7), S=c(.1, .9, .7, .3)))

getgrain(wet.bn2, "cpt")$R
getgrain(wet.bn2, "cpt")$S

}
\references{
Søren Højsgaard (2012). Graphical Independence
Networks with the gRain Package for R. Journal of Statistical
Software, 46(10), 1-26.
\url{http://www.jstatsoft.org/v46/i10/}.
}
\seealso{
\code{\link{grain}}, \code{\link[gRbase]{propagate}},
\code{\link[gRbase]{triangulate}}, \code{\link[gRbase]{rip}},
\code{\link[gRbase]{junctionTree}}
}
\author{
Søren Højsgaard, \email{sorenh@math.aau.dk}
}
\keyword{models}
\keyword{utilities}
