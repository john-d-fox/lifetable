## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  message = TRUE,
  warning = TRUE,
  fig.align = "center",
  fig.height = 6,
  fig.width = 7,
  fig.path = "fig/",
  dev = "png",
  comment = "#>" #,
)
.opts <- options(scipen=10)

## ----CanadaDeaths2023---------------------------------------------------------
library("lifetable")
CanadaDeaths2023

## ----female-mortality---------------------------------------------------------
(CanMort23 <- with(CanadaDeaths2023, 
                   mortalityRates(population = population.female,
                                  deaths = deaths.female,
                                  start = start, end = end,
                                  day = "2023-07-01")))

## ----mortality-data-----------------------------------------------------------
CanadaMortality # 5-year age groups after age 4

head(CanadaMortalitySingleYear) # single-year data
tail(CanadaMortalitySingleYear) # single-year data

## ----lifetable-args-----------------------------------------------------------
args(lifetable)

## ----single-year-life-table---------------------------------------------------
(lt.female <- lifetable(q = CanadaMortalitySingleYear$q.female))

## ----female-male-survival-----------------------------------------------------
lt.male <- lifetable(q = CanadaMortalitySingleYear$q.male)
plot(0:109, lt.male[, "l[x]"]/1000, type="l", col="magenta", 
      lwd=2, lty=2, xlab="Age", ylab="Percent Surviving")
 lines(0:109, lt.female[, "l[x]"]/1000, type="l", col="blue",
       lty=1, lwd=2)
 legend("bottomleft", inset=0.02, legend=c("female", "male"),
        lty=1:2, lwd=2, col=c("blue", "magenta"))
 grid()

## ----recall-CanMort23---------------------------------------------------------
CanMort23

## ----life-table-5yr-----------------------------------------------------------
with(CanMort23,
     lifetable(q=mortality.rate, start=start, end=end))

## ----CanadaMortality----------------------------------------------------------
CanadaMortality

## ----life-table-irregular-groups----------------------------------------------
with(CanadaMortality,
     lifetable(q=q.male, start=start, end=end))

## ----coda, include=FALSE------------------------------------------------------
options(.opts)

