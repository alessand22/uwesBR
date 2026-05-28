# uwesBR

`uwesBR` é um pacote em R para cálculo dos escores das escalas de engajamento no trabalho UWES-9 e UWES-17 (*Utrecht Work Engagement Scale*).

O pacote calcula:

* Escores das dimensões:

  * Vigor
  * Dedicacao
  * Absorcao
* Escore geral de Engajamento
* Classificacoes normativas
* Estatisticas descritivas agregadas

Atualmente, o pacote inclui as normas brasileiras adaptadas por Angst et al. (2009).

---

# Instalacao

```r
# Instalar pacote remotes, se necessario
install.packages("remotes")

# Instalar uwesBR diretamente do GitHub
remotes::install_github("alessand22/uwesBR")
```

---

# Exemplo de uso - UWES-9

```r
library(uwesBR)

# Simulacao de dados
df <- data.frame(
  matrix(
    sample(0:6, 180, replace = TRUE),
    ncol = 9
  )
)

resultado <- uwes9(df)

# Resultados individuais
head(resultado$Individual)

# Resumo geral
resultado$Geral
```

---

# Exemplo de uso - UWES-17

```r
library(uwesBR)

df <- data.frame(
  matrix(
    sample(0:6, 340, replace = TRUE),
    ncol = 17
  )
)

resultado <- uwes17(df)

resultado$Individual

resultado$Geral
```

---

# Estrutura dos resultados

As funcoes retornam uma lista contendo:

* `Individual`

  * Escores individuais
  * Classificacoes por participante

* `Geral`

  * Medias das dimensoes
  * Desvios padrao
  * Classificacoes agregadas

---

# Normas disponiveis

Atualmente:

* `angst2009`

O pacote foi estruturado para permitir futuras inclusoes de novas normas nacionais e internacionais.

---

# Referencias

Angst, R., Benevides-Pereira, A. M. T., & Porto-Martins, P. C. (2009). *Manual tecnico do UWES adaptado para o Brasil*. Curitiba: GEPEB.

Schaufeli, W. B., Bakker, A. B., & Salanova, M. (2006). *The measurement of work engagement with a short questionnaire: A cross-national study*. Educational and Psychological Measurement, 66(4), 701-716.

Paschoal, T., & Tamayo, A. (2008). *Validacao da Escala de Engajamento no Trabalho (UWES) no Brasil*. Revista de Administracao, 43(1), 65-75.

---

# Autor

Alessandro de Castro Correa
Instituto Federal do Para (IFPA)

---

# Licenca

MIT License
