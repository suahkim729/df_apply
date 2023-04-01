# rpackage-dfapply
This R Package `dfapply` is to apply df_apply function that rounds up the numbers in a given data frame.


## Installation
You can install the package from with: [suahkim729/dfapply](https://github.com/suahkim729/dfapply)
```{r}
# install.packages("devtools")
devtools::install_github("suahkim729/dfapply")
```

## Example
The following shows an example of how you can apply the dfapply function to a data frame.
```{r}
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
```
## Team Members: Sharon, Sherise, Suah
