#' Classifica escores do UWES segundo normas disponiveis
#'
#' @param vetor Vetor numerico de escores.
#' @param dimensao Dimensao avaliada.
#' @param norma Norma utilizada.
#'
#' @return Vetor de classificacoes.
#'
#' @keywords internal

classificar_uwes <- function(vetor,
                             dimensao,
                             norma = "angst2009") {
  if (!norma %in% names(normas_uwes)) {
    stop("Norma invalida.")
  }

  regras <- normas_uwes[[norma]][[dimensao]]

  x <- round(vetor, 2)

  classificacao <- character(length(x))

  classificacao[
    x >= regras$muito_baixo[1] &
      x <= regras$muito_baixo[2]
  ] <- "Muito baixo"

  classificacao[
    x >= regras$baixo[1] &
      x <= regras$baixo[2]
  ] <- "Baixo"

  classificacao[
    x >= regras$medio[1] &
      x <= regras$medio[2]
  ] <- "Medio"

  classificacao[
    x >= regras$alto[1] &
      x <= regras$alto[2]
  ] <- "Alto"

  classificacao[
    x >= regras$muito_alto[1] &
      x <= regras$muito_alto[2]
  ] <- "Muito alto"

  return(classificacao)

}

