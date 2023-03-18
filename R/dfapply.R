library(dplyr)
n <- 7L
TestData <-
  tibble( double = rnorm(n, 100, 10),
          x = 123400 / 10^(1L:n),
          integer = (1L:n) * (1L:n),    # ^2 would return a double!! #<<
          character = LETTERS[1L:n],
          factor = factor(letters[1L:n]),
          logical = rep(c(TRUE, FALSE), length.out = n) )

TestData1 <-
  tibble( double = rnorm(n, 100, 10))


fun <- function(x, digits){
  #if (is.numeric(x)) round(x, digits = digits) else x
  round(x, digits = digits)
}

filter <- function(x){
 # if (is.numeric(x)) {return (TRUE)} else {return (FALSE)}}
  return (TRUE)
}

df_apply <- function(.data, .fun, .filter, digits){
  if (filter(.data))
    lapply(.data, `fun`, digits = digits) |>
    as_tibble()
}



df_apply(TestData1, digits = 0)

filter(TestData1)
