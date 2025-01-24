if(requireNamespace('spelling', quietly = TRUE))
  spelling::spell_check_test(error = FALSE,
                             skip_on_cran = TRUE)
