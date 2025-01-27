#' Calculate age-specific mortality rates
#' 
#' @description
#' Calculate age-specific mortality rates from number of deaths
#' and population by single years of age or age groups.
#' @param population number of individuals in the age interval
#' @param deaths number of deaths in the age interval during the calendar year
#' @param start the age in years at the start of each age interval;
#' if missing, then the default is single years from \code{0} to 
#' \code{n - 1}, where \code{n} is the number of intervals
#' @param end the age in years at the end of each interval; the
#' default is \code{start}, which produces single-year intervals;
#' if the last interval is open-ended then \code{end[n]} can be 
#' \code{Inf}
#' @param day day of the year on which \code{population} was measured; 
#' may be a number, defaulting to \code{182} (July 1 in a non-leap-year), 
#' or any value that can be 
#' interpreted by the \code{\link[lubridate]{yday}()} function in the 
#' \pkg{lubridate} package
#' @param leapyear \code{TRUE} if \code{day} occurs in a leap-year
#' (default is \code{FALSE})
#' @param a0 proportion of deaths that take place during the first
#' half of the first year of life, default \code{0.7}; used only if
#' the first age interval is the single year age 0
#' @param a1 proportion of deaths that take place during the first
#' half of the second year of life, default \code{0.6}; used only if
#' the second age interval is the single year from age 1
#' @details Calculates the single-year mortality rate at each age
#' or in each age group. First, population size on January 1 is
#' approximated by adding the interpolated number of deaths between
#' January 1 and the date at which population is measured, assuming
#' that deaths are evenly spread throughout the year (with the exception
#' of the first and second single years of life, where \code{a0} and
#' \code{a1} proportion of deaths, respectively, are assumed to occur during the
#' first half of each of these years of life).
#' @returns a data frame with, for single-year data, columns for
#' \code{age} and the one-year \code{mortality.rate}, or, for 
#' age-grouped data, columns for the \code{start} and \code{end}
#' in years of each age group, and the one-year \code{mortality.rate}.
#' @seealso \code{\link{lifetable}}, \code{\link[lubridate]{yday}}
#' @author John Fox \email{jfox@mcmaster.ca}
#' @export
#' @examples
#' (mortality2023 <- with(CanadaDeaths2023,  
#'                        mortalityRates(population.female, deaths.female,
#'                              start=start, end=end, day="2023-07-02")))
#' with(mortality2023, lifetable(mortality2023$mortality.rate,
#'                               start=start, end=end))
mortalityRates <- function(population, deaths, 
                           start=0:(n - 1), end=start, 
                           day=182, leapyear=FALSE,
                           a0=0.7, a1=0.6){
  interpolate <- function(population, deaths, a=0.5){
    f <- if (day <= 0.5){
      2*day*a
    } else {
      a + (1 - a)*(day - 0.5)/0.5
    }
    population + deaths*f
  }
  if (!is.numeric(day)) day <- lubridate::yday(day)
  day <- day/(365 + leapyear)
  n <- length(population)
  population[1] <- if (start[1] == 0 && end[1] == 0){
    interpolate(population[1], deaths[1], a=a0)
  } else {
    interpolate(population[1], deaths[1])
  }
  population[2] <- if (start[2] == 1 && end[2] == 1){
    interpolate(population[2], deaths[2], a=a1)
  } else {
    interpolate(population[2], deaths[2])
  }
  for (i in 3:n){
    population[i] <- interpolate(population[i], deaths[i])
  }
  q <- deaths/population
  if (all(start == end)) {
    return(data.frame(age=start, mortality.rate=q))
  } else {
    return(data.frame(start=start, end=end, mortality.rate=q))
  }
}
