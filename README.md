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
TestData <- data.frame(A = c(1.092, 300.81, 399.203, 20.4934),
                       B = c(503.47, 29.89, 293.90, 3.01),
                       C = c(80.29, 19.867, 39.20, 182.93))

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

### Team Members: Sharon, Sherise, Suah
