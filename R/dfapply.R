library(dplyr)
n <- 7L
TestData <-
  tibble( double = rnorm(n, 100, 10),
          x = 123400 / 10^(1L:n),
          integer = (1L:n) * (1L:n),    # ^2 would return a double!! #<<
          character = LETTERS[1L:n],
          factor = factor(letters[1L:n]),
          logical = rep(c(TRUE, FALSE), length.out = n))

rfun <- function(x) round(x)
rfilter <- function(x) is.numeric(x)


df_apply <- function(.data, .fun, .filter) {
  modified_columns <- lapply(.data, function(x) {
    if (.filter(x)){.fun(x)} else {x}
  })
  return(data.frame(modified_columns))
}

df_apply(TestData, rfun, rfilter)
