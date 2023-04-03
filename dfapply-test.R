df <- data.frame(
  A = c(1, 2, 3),
  B = c(4, 5, 6),
  C = c("foo", "bar", "baz")
)

test_that("df_apply works", {
  expect_equal(
    df_apply(df, function(x) x * 2, is.numeric),
    data.frame(
      A = c(2, 4, 6),
      B = c(8, 10, 12),
      C = c("foo", "bar", "baz")
    ))
})

df_2 <- data.frame(
  A = c(1/3, 2/4, 3.5),
  B = c(10,100,"cat"),
  C = c("orange", "blue", "red")
)

test_that("df_apply works", {
  expect_equal(
    df_apply(df_2, function(x) x * 2, is.numeric),
    data.frame(
      A = c(2/3, 1, 7),
      B = c(10, 100, "cat"),
      C = c("orange", "blue", "red")
    ))
})

not_df <- c(12, 13, 14, 15)

test_that("df_apply works", {
  expect_error(
    df_apply(not_df, function(x) x * 2, is.numeric)
  )
})
