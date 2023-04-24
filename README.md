
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
#> Downloading GitHub repo suahkim729/dfapply@HEAD
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>      checking for file ‘/tmp/Rtmpubw4WL/remotes3b35d1b4a3f/suahkim729-dfapply-cb16cc4/DESCRIPTION’ ...  ✔  checking for file ‘/tmp/Rtmpubw4WL/remotes3b35d1b4a3f/suahkim729-dfapply-cb16cc4/DESCRIPTION’
#>   ─  preparing ‘dfapply’:
#>      checking DESCRIPTION meta-information ...  ✔  checking DESCRIPTION meta-information
#>   ─  excluding invalid files
#>      Subdirectory 'R' contains invalid file names:
#>      ‘Tomato.csv’
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#> ─  building ‘dfapply_0.0.0.9000.tar.gz’
#>      Warning: invalid uid value replaced by that for user 'nobody'
#>    Warning: invalid gid value replaced by that for user 'nobody'
#>    
#> 
#> Installing package into '/home/snk23/R/x86_64-pc-linux-gnu-library/4.2'
#> (as 'lib' is unspecified)
```

rpackage-dfapply This R Package `dfapply` is to apply df_apply function
that rounds up the numbers in a given data frame.

## Installation

You can install the package from with:
[suahkim729/dfapply](https://github.com/suahkim729/dfapply)

``` r
# install.packages("devtools")
devtools::install_github("suahkim729/dfapply")
#> Skipping install of 'dfapply' from a github remote, the SHA1 (cb16cc49) has not changed since last install.
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

#### Team Members: Sharon, Sherise, Suah
