#' Calcula escores do UWES
#'
#' Função interna utilizada pelas versões UWES-9 e UWES-17.
#'
#' @keywords internal
#' @importFrom stats sd



calcular_uwes <- function(df,
                          itens_vigor,
                          itens_dedicacao,
                          itens_absorcao,
                          total_itens,
                          norma = "angst2009") {

  # =========================
  # Validação
  # =========================

  validar_uwes(df, total_itens)


  # =========================
  # Cálculo dos escores
  # =========================

  vigor <- rowMeans(
    df[, itens_vigor],
    na.rm = TRUE
  )

  dedicacao <- rowMeans(
    df[, itens_dedicacao],
    na.rm = TRUE
  )

  absorcao <- rowMeans(
    df[, itens_absorcao],
    na.rm = TRUE
  )

  engajamento <- rowMeans(
    df[, 1:total_itens],
    na.rm = TRUE
  )


  # =========================
  # Classificações individuais
  # =========================

  class_vigor <- classificar_uwes(
    vigor,
    "Vigor",
    norma
  )

  class_dedicacao <- classificar_uwes(
    dedicacao,
    "Dedicacao",
    norma
  )

  class_absorcao <- classificar_uwes(
    absorcao,
    "Absorcao",
    norma
  )

  class_engajamento <- classificar_uwes(
    engajamento,
    "Engajamento",
    norma
  )


  # =========================
  # Estatísticas gerais
  # =========================

  media_vigor <- mean(vigor, na.rm = TRUE)

  media_dedicacao <- mean(dedicacao, na.rm = TRUE)

  media_absorcao <- mean(absorcao, na.rm = TRUE)

  media_engajamento <- mean(engajamento, na.rm = TRUE)


  # =========================
  # Classificações gerais
  # =========================

  class_media_vigor <- classificar_uwes(
    media_vigor,
    "Vigor",
    norma
  )

  class_media_dedicacao <- classificar_uwes(
    media_dedicacao,
    "Dedicacao",
    norma
  )

  class_media_absorcao <- classificar_uwes(
    media_absorcao,
    "Absorcao",
    norma
  )

  class_media_engajamento <- classificar_uwes(
    media_engajamento,
    "Engajamento",
    norma
  )


  # =========================
  # Resumo geral
  # =========================

  resumo_geral <- data.frame(

    Dimensao = c(
      "Vigor",
      "Dedicacao",
      "Absorcao",
      "Engajamento"
    ),

    Media = round(
      c(
        media_vigor,
        media_dedicacao,
        media_absorcao,
        media_engajamento
      ),
      2
    ),

    DP = round(
      c(
        sd(vigor, na.rm = TRUE),
        sd(dedicacao, na.rm = TRUE),
        sd(absorcao, na.rm = TRUE),
        sd(engajamento, na.rm = TRUE)
      ),
      2
    ),

    Classificacao = c(
      class_media_vigor,
      class_media_dedicacao,
      class_media_absorcao,
      class_media_engajamento
    ),

    stringsAsFactors = FALSE

  )


  # =========================
  # Retorno
  # =========================

  return(

    list(

      Individual = data.frame(

        Vigor = vigor,

        Dedicacao = dedicacao,

        Absorcao = absorcao,

        Engajamento = engajamento,

        Class_Vigor = class_vigor,

        Class_Dedicacao = class_dedicacao,

        Class_Absorcao = class_absorcao,

        Class_Engajamento = class_engajamento,

        stringsAsFactors = FALSE

      ),

      Geral = resumo_geral

    )

  )

}
