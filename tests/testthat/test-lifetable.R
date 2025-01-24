test_that("survival is computed correctly for single-year LT", {
  lifetable <- as.vector(lifetable(rep(0.5, 10), a0=0.5, a1=0.5)[, "l[x]"])
  direct <- numeric(10)
  direct[1] <- 100000
  for (i in 2:10){
    direct[i] <- round(direct[i - 1]/2)
  }
  expect_lte(max(abs(lifetable - direct)), 1)
})

test_that("survival is computed correctly for grouped-year LT", {
  lifetable <- as.vector(lifetable(rep(0.1, 20), start=c(0, 1, seq(5, 90, by=5)), 
                                   end=c(0, seq(4, 89, by=5), Inf), 
                                   a0=0.5, a1=0.5)[, "l[x]"])
  direct <- numeric(20)
  direct[1] <- 100000
  direct[2] <- round(direct[1]*0.9)
  direct[3] <- round(direct[2]*(0.9^4))
  for (i in 4:20){
    direct[i] <- round(direct[i - 1]*(0.9^5))
  }
  expect_equal(lifetable, direct)
})

