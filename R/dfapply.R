library(dplyr)
n <- 7L
TestData <-
  tibble( double = rnorm(n, 100, 10),
          x = 123400 / 10^(1L:n),
          integer = (1L:n) * (1L:n),    # ^2 would return a double!! #<<
          character = LETTERS[1L:n],
          factor = factor(letters[1L:n]),
          logical = rep(c(TRUE, FALSE), length.out = n) )


fun <- function(.data, digits){
  if (is.numeric(x)) round(x, digits = digits) else x
}


df_apply <- function(.data, .fun, digits){
  lapply(.data, `fun`, digits = digits) |>
    as_tibble()
}


df_apply(TestData, digits = 2)
