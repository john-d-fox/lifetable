test_that("survival is computed correctly", {
  lifetable <- as.vector(lifetable(rep(0.5, 10))[, "l[x]"])
  direct <- numeric(10)
  direct[1] <- 100000
  for (i in 2:10){
    direct[i] <- round(direct[i - 1]/2)
  }
  expect_lte(max(abs(lifetable - direct)), 1)
})
