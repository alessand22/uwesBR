#' Calcula os escores do UWES-9 e suas classificações
#'
#' Calcula os escores médios das três dimensões do UWES-9
#' (Vigor, Dedicação e Absorção), além do escore geral
#' de Engajamento no Trabalho.
#'
#' Os escores também são classificados segundo as normas
#' disponíveis no pacote.
#'
#' @param df Um data.frame ou tibble contendo os 9 itens
#' do UWES-9. Cada linha representa um respondente e
#' cada coluna um item do instrumento.
#'
#' Os itens devem conter respostas numéricas entre 0 e 6.
#'
#' @param norma String indicando a norma utilizada para
#' classificação.
#'
#' Atualmente disponível:
#' \describe{
#'   \item{angst2009}{
#'   Normas brasileiras adaptadas por Angst et al. (2009).
#'   }
#' }
#'
#' @return Uma lista contendo dois data.frames:
#'
#' \describe{
#'
#'   \item{Individual}{
#'   Escores individuais das dimensões do UWES-9 e suas
#'   respectivas classificações.
#'   }
#'
#'   \item{Geral}{
#'   Médias gerais, desvios padrão e classificações
#'   agregadas das dimensões.
#'   }
#'
#' }
#'
#' @details
#' As dimensões do UWES-9 são calculadas da seguinte forma:
#'
#' \describe{
#'
#'   \item{Vigor}{
#'   Média dos itens 1, 2 e 5.
#'   }
#'
#'   \item{Dedicacao}{
#'   Média dos itens 3, 4 e 7.
#'   }
#'
#'   \item{Absorcao}{
#'   Média dos itens 6, 8 e 9.
#'   }
#'
#'   \item{Engajamento}{
#'   Média de todos os 9 itens.
#'   }
#'
#' }
#'
#' Para fins de classificação normativa, os escores são
#' classificados considerando arredondamento em duas casas
#' decimais.
#'
#' Este pacote foi desenvolvido no contexto do Grupo de
#' Estudos Avançados em Gestão (GEAG-IFPA), vinculado ao
#' Instituto Federal de Educação, Ciência e Tecnologia do
#' Pará (IFPA), como parte de um projeto de avaliação de
#' engajamento no trabalho.
#'
#' @author
#' Alessandro de Castro Corrêa
#' <alessandro.correa@ifpa.edu.br>
#'
#' @references
#'
#' Angst, R., Benevides-Pereira, A. M. T., &
#' Porto-Martins, P. C. (2009).
#' Manual técnico do UWES adaptado para o Brasil.
#' Curitiba: GEPEB.
#'
#' Moreira, M. L. R., Mattos, C. A. C.,
#' Mancebo, C. H. A., & Correa, A. C. (2020).
#' Engagement at work: a research with state public servants.
#' Navus, 11, 1-15.
#'
#' Paschoal, T., & Tamayo, A. (2008).
#' Validação da Escala de Engajamento no Trabalho (UWES)
#' no Brasil. Revista de Administração, 43(1), 65-75.
#'
#' Schaufeli, W. B., Bakker, A. B., &
#' Salanova, M. (2006).
#' The measurement of work engagement with a short
#' questionnaire: A cross-national study.
#' Educational and Psychological Measurement,
#' 66(4), 701-716.
#'
#' @examples
#' df <- data.frame(
#'   matrix(
#'     sample(0:6, 180, replace = TRUE),
#'     ncol = 9
#'   )
#' )
#'
#' resultado <- uwes9(df)
#'
#' head(resultado$Individual)
#'
#' resultado$Geral
#'
#' @seealso
#' \code{\link{uwes17}}
#'
#' @export

uwes9 <- function(df,
                  norma = "angst2009") {
  calcular_uwes(
    df = df,
    itens_vigor = c(1, 2, 5),
    itens_dedicacao = c(3, 4, 7),
    itens_absorcao = c(6, 8, 9),
    total_itens = 9,
    norma = norma
  )
}
