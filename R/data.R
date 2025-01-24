#' Sex-specific mortality rates for Canada in 2023 by age groups
#' 
#' @format `CanadaMortality`
#' A data frame with 20 rows and 4 columns:
#' \describe{
#'   \item{start}{age in years at start of age interval}
#'   \item{end}{age in years at end of age interval}
#'   \item{q.female}{female mortality rate, annual probability of
#'   dying in the age interval}
#'   \item{q.male}{male mortality rate, annual probability of
#'   dying in the age interval}
#' }
#' @examples
#' CanadaMortality
#' @source \url{https://doi.org/10.25318/1310071001-eng}
#' downloaded 2025-01-22
"CanadaMortality"

#' Sex-specific mortality rates for Canada in 2022--2023 by single years of age
#' 
#' @format `CanadaMortalitySingleYear`
#' A data frame with 110 rows and 3 columns:
#' \describe{
#'   \item{age}{age in years}
#'   \item{q.female}{female mortality rate, probability of
#'   dying during the year}
#'   \item{q.male}{male mortality rate, probability of
#'   dying during the year}
#' }
#' @source \url{https://doi.org/10.25318/1310011401-eng}
#' downloaded 2025-01-23
#' @examples
#' head(CanadaMortalitySingleYear)
#' tail(CanadaMortalitySingleYear)
#' 
"CanadaMortalitySingleYear"
