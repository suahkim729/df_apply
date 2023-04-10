
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dfapply

<!-- badges: start -->
<!-- badges: end -->

The goal of dfapply is to apply df_apply function that rounds up the
numbers in a given data frame.

## Installation

You can install the development version of dfapply from
[GitHub](https://github.com/suahkim729/dfapply) with:

``` r
# install.packages("devtools")
devtools::install_github("suahkim729/dfapply")
#> Skipping install of 'dfapply' from a github remote, the SHA1 (a67cfa85) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

rpackage-dfapply This R Package `dfapply` is to apply df_apply function
that rounds up the numbers in a given data frame.

## Installation

You can install the package from with:
[suahkim729/dfapply](https://github.com/suahkim729/dfapply)

``` r
# install.packages("devtools")
devtools::install_github("suahkim729/dfapply")
#> Skipping install of 'dfapply' from a github remote, the SHA1 (a67cfa85) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

## Example

The following shows an example of how you can apply the dfapply function
to a data frame.

``` r
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
#>     A   B   C
#> 1   1 503  80
#> 2 301  30  20
#> 3 399 294  39
#> 4  20   3 183
```

### Team Members: Sharon, Sherise, Suah
