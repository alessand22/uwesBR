library(testthat)
library(uwesBR)

test_that("Aceita data.frame como entrada", {
  df <- data.frame(
    matrix(
      sample(0:6, 340, replace = TRUE),
      ncol = 17
    )
  )
  expect_silent(
    uwes17(df)
  )
})

test_that("Aceita tibble como entrada", {
  df <- tibble::as_tibble(
    matrix(
      sample(0:6, 340, replace = TRUE),
      ncol = 17
    ),
    .name_repair = "unique"
  )
  expect_silent(
    uwes17(df)
  )
})


test_that("Rejeita matriz como entrada", {
  mat <- matrix(
    sample(0:6, 340, replace = TRUE),
    ncol = 17
  )
  expect_error(
    uwes17(mat),
    "data.frame ou tibble"
  )
})


test_that("Avisa quando ha valores NA", {
  df <- data.frame(
    matrix(
      sample(c(0:6, NA), 340, replace = TRUE),
      ncol = 17
    )
  )
  expect_warning(
    uwes17(df),
    "contem valores NA"
  )
})


test_that("Retorna lista com estruturas esperadas", {
  df <- data.frame(
    matrix(
      sample(0:6, 340, replace = TRUE),
      ncol = 17
    )
  )
  resultado <- uwes17(df)
  expect_type(resultado, "list")
  expect_named(
    resultado,
    c("Individual", "Geral")
  )
  expect_s3_class(
    resultado$Individual,
    "data.frame"
  )
  expect_s3_class(
    resultado$Geral,
    "data.frame"
  )
})


test_that("Retorna colunas esperadas em Individual", {
  df <- data.frame(
    matrix(
      sample(0:6, 340, replace = TRUE),
      ncol = 17
    )
  )
  resultado <- uwes17(df)
  expect_named(
    resultado$Individual,
    c(
      "Vigor",
      "Dedicacao",
      "Absorcao",
      "Engajamento",
      "Class_Vigor",
      "Class_Dedicacao",
      "Class_Absorcao",
      "Class_Engajamento"
    )
  )
})


test_that("Retorna colunas esperadas em Geral", {
  df <- data.frame(
    matrix(
      sample(0:6, 340, replace = TRUE),
      ncol = 17
    )
  )
  resultado <- uwes17(df)
  expect_named(
    resultado$Geral,
    c(
      "Dimensao",
      "Media",
      "DP",
      "Classificacao"
    )
  )
})
