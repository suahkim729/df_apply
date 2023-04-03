
#' Apply a function that can be applied to a columns of a data frame
#'
#' @param .data should expect a data frame
#' @param .fun  expect a function that can be applied to a column of a data frame and return a column of a data frame
#' @param .filter should expect a function that can be applied to a columns of a data frame and returns a logical (TRUE or FALSE)
#'
#'
#' @return data frame that is a modified version of .data
#' @importFrom tibble tibble
#' @export
#'
#' @examples
#'
#' TestData <-tibble( double = rnorm(n, 100, 10),
#'   x = 123400 / 10^(1L:n),
#'   integer = (1L:n) * (1L:n),
#'   character = LETTERS[1L:n],
#'   factor = factor(letters[1L:n]),
#'   logical = rep(c(TRUE, FALSE), length.out = n))
#' df_apply <- function(.data, .fun, .filter) {modified_columns <-lapply(.data, function(x) {if (.filter(x)){.fun(x)} else {x}}) return(data.frame(modified_columns))}
#' df_apply(TestData, rfun, rfilter)


df_apply <- function(.data, .fun, .filter) {
  modified_columns <- lapply(.data, function(x) {
    if (.filter(x)){.fun(x)} else {x}
  })
  return(data.frame(modified_columns))
}


n <- 7L
TestData <-
  tibble::tibble( double = rnorm(n, 100, 10),
          x = 123400 / 10^(1L:n),
          integer = (1L:n) * (1L:n),    # ^2 would return a double!! #<<
          character = LETTERS[1L:n],
          factor = factor(letters[1L:n]),
          logical = rep(c(TRUE, FALSE), length.out = n))

rfun <- function(x) round(x)
rfilter <- function(x) is.numeric(x)


df_apply(TestData, rfun, rfilter)
