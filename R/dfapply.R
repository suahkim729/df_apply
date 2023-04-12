
#' Apply a function that can be applied to a columns of a data frame (rounding number)
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
#'df_apply <- function(.data, .fun, .filter) {modified_columns <- lapply(.data, function(x) {
#'if (.filter(x)){.fun(x)} else {x}})
#'return(data.frame(modified_columns))}
#'
#'rfun <- function(x) round(x)
#'rfilter <- function(x) is.numeric(x)
#'
#' TestData <- data.frame(A = c(1.092, 300.81, 399.203, 20.4934),
#' B = c(503.47, 29.89, 293.90, 3.01),
#' C = c(80.29, 19.867, 39.20, 182.93))
#'
#' df_apply(TestData, rfun, rfilter)




df_apply <- function(.data, .fun, .filter) {
  modified_columns <- lapply(.data, function(x) {
    if (.filter(x)){.fun(x)} else {x}
  })
  return(data.frame(modified_columns))
}

rfun <- function(x) round(x)
rfilter <- function(x) is.numeric(x)


df_apply(TestData, rfun, rfilter)

TestData <- data.frame(A = c(1.092, 300.81, 399.203, 20.4934),
                       B = c(503.47, 29.89, 293.90, 3.01),
                       C = c(80.29, 19.867, 39.20, 182.93))


