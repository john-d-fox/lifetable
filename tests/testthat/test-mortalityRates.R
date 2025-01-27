pop <- rep(1000, 10)
deaths <- (1:10)*100
m <- mortalityRates(pop, deaths, day=0)
all.equal(m$mortality.rate, (1:10)/10)

m <- mortalityRates(pop, deaths, day=365/2)
mm <- deaths/(pop + 0.5*deaths)
mm[1] <- deaths[1]/(pop[1] + 0.7*deaths[1])
mm[2] <- deaths[2]/(pop[2] + 0.6*deaths[2])
all.equal(m$mortality.rate, mm)

test_that("mortality rates are computed correctly: test 1", {
  pop <- rep(1000, 10)
  deaths <- (1:10)*100
  m <- mortalityRates(pop, deaths, day=0)
  expect_equal(m$mortality.rate, (1:10)/10)
})

test_that("mortality rates are computed correctly: test 2", {
  pop <- rep(1000, 10)
  deaths <- (1:10)*100
  m <- mortalityRates(pop, deaths, day=365/2)
  mm <- deaths/(pop + 0.5*deaths)
  mm[1] <- deaths[1]/(pop[1] + 0.7*deaths[1])
  mm[2] <- deaths[2]/(pop[2] + 0.6*deaths[2])
  expect_equal(m$mortality.rate, mm)
})
