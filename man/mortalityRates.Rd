% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mortalityRates.R
\name{mortalityRates}
\alias{mortalityRates}
\title{Calculate age-specific mortality rates}
\usage{
mortalityRates(
  population,
  deaths,
  start = 0:(n - 1),
  end = start,
  day = 182,
  leapyear = FALSE,
  a0 = 0.7,
  a1 = 0.6
)
}
\arguments{
\item{population}{number of individuals in the age interval}

\item{deaths}{number of deaths in the age interval during the calendar year}

\item{start}{the age in years at the start of each age interval;
if missing, then the default is single years from \code{0} to 
\code{n - 1}, where \code{n} is the number of intervals}

\item{end}{the age in years at the end of each interval; the
default is \code{start}, which produces single-year intervals;
if the last interval is open-ended then \code{end[n]} can be 
\code{Inf}}

\item{day}{day of the year on which \code{population} was measured; 
may be a number, defaulting to \code{182} (July 1 in a non-leap-year), 
or any value that can be 
interpreted by the \code{\link[lubridate]{yday}()} function in the 
\pkg{lubridate} package}

\item{leapyear}{\code{TRUE} if \code{day} occurs in a leap-year
(default is \code{FALSE})}

\item{a0}{proportion of deaths that take place during the first
half of the first year of life, default \code{0.7}; used only if
the first age interval is the single year age 0}

\item{a1}{proportion of deaths that take place during the first
half of the second year of life, default \code{0.6}; used only if
the second age interval is the single year from age 1}
}
\value{
a data frame with, for single-year data, columns for
\code{age} and the one-year \code{mortality.rate}, or, for 
age-grouped data, columns for the \code{start} and \code{end}
in years of each age group, and the one-year \code{mortality.rate}.
}
\description{
Calculate age-specific mortality rates from number of deaths
and population by single years of age or age groups.
}
\details{
Calculates the single-year mortality rate at each age
or in each age group. First, population size on January 1 is
approximated by adding the interpolated number of deaths between
January 1 and the date at which population is measured, assuming
that deaths are evenly spread throughout the year (with the exception
of the first and second single years of life, where \code{a0} and
\code{a1} proportion of deaths, respectively, are assumed to occur during the
first half of each of these years of life).
}
\examples{
(mortality2023 <- with(CanadaDeaths2023,  
                       mortalityRates(population.female, deaths.female,
                             start=start, end=end, day="2023-07-02")))
with(mortality2023, lifetable(mortality.rate, start=start, end=end))
}
\seealso{
\code{\link{lifetable}}, \code{\link[lubridate]{yday}}
}
\author{
John Fox \email{jfox@mcmaster.ca}
}
