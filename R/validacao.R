#' Valida dados do UWES
#'
#' @param df data.frame contendo respostas.
#' @param total_itens Numero esperado de itens.
#'
#' @return Nenhum retorno. A funcao interrompe em caso de erro.
#'
#' @keywords internal

validar_uwes <- function(df, total_itens) {

  if (!inherits(df, "data.frame")) {
    stop("O objeto fornecido deve ser um data.frame ou tibble.")
  }

  if (ncol(df) != total_itens) {
    stop(
      paste0(
        "O data.frame deve conter exatamente ",
        total_itens,
        " colunas."
      )
    )
  }

  if (!all(sapply(df, is.numeric))) {
    stop("Todas as colunas devem ser numericas.")
  }

  if (any(df < 0 | df > 6, na.rm = TRUE)) {
    stop("Todos os valores devem estar entre 0 e 6.")
  }

  if (anyNA(df)) {
    warning(
      paste0(
        "Os dados contem valores NA. ",
        "Os escores serao calculados ignorando esses valores."
      )
    )
  }

}
