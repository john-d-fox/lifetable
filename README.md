<!-- badges: start -->
[![R-CMD-check](https://github.com/john-d-fox/lifetable/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/john-d-fox/lifetable/actions/workflows/R-CMD-check.yaml) 
[![Last Commit](https://img.shields.io/github/last-commit/john-d-fox/lifetable)](https://github.com/john-d-fox/lifetable)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

# **lifetable**: Create Standard Life Tables

The package contains a single function, `lifetable()`, for creating
standard life tables from age-specific mortality rates. Both single-year
and grouped (e.g., 5-year) life tables are supported.

Two data sets are included in the package:

- `CanadaMortality` contains 5-year age-specific mortality rates
for females and males in Canada in 2023 (with the first
two age groups 0 and 1--4).
- `CanadaMortalitySingleYear` contains single-year age-specific
mortality rates for females and males in Canada in the period
2021--2023.

To install the development version of the **lifetable** package
from GitHub:
```
 if (!require(remotes)) install.packages("remotes")
 remotes::install_github("john-d-fox/lifetable")
```


