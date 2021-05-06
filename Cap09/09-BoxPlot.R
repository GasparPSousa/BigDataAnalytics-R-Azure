# Interpretando um BoxPlot

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap09")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


##### Boxplot #####

# Box-plot, ou diagrama de caixa, é possível obter informações sobre vários aspectos dos dados simultaneamente como, 
# outliers, dispersão, tendências centrais, erros padrão e simetria. 

# Utilizado para avaliar a distribuição empírica dos dados, é formado pelo primeiro e terceiro quartis, 
# juntamente com a mediana.

dados = c(18, 20, 20, 21, 22, 24, 25, 25, 26, 27, 29, 29, 
          30, 30, 31, 31, 32, 33, 34, 35, 36, 36, 37, 37, 
          37, 37, 38, 38, 38, 40, 41, 43, 44, 44, 45, 45, 
          45, 46, 47, 48, 49, 50, 51, 53, 54, 54, 56, 58, 62, 65)

mean(dados)
sd(dados)
median(dados)
range(dados)
quantile(dados)

boxplot(dados, main = "Número de Acidentes Diários")

#' Daqui em diante, sempre que você tiver começando um processo de análise:
#' 1º Calcule as Estatísticas.
#' 2º Desenhar o histograma e o BoxPlot.
#' 
#' Isso vai dar a você uma visão bastante completa de como os dados estão organizados.
#' 
#' E um exercício que recomendo com frequência.
#' 
#' Quando você tiver fazendo um processo de análise, vai criando uma espécie de tracking, 
#' como se fosse uma espécie de Diário...Ou seja, começou o processo de análise, 
#' desenha o histograma e o boxplot e calcula as estatísticas e grava esse resultado em algum lugar.
#' Depois você vai trabalhar na limpeza dos dados, no processamento, transformação e etc...
#' Aí você vai de novo, calcular as estatísticas, desenha os histogramas e boxplots e guarda o resultado.
#' Se necessário, repete o processo e depois compara tudo isso no final.
#' Você vai perceber como os dados vão mudando completamente seu comportamento a medida que vou aplicando limpeza, transformação e etc.
#' Ou seja, eu vou transformando os dados, dando um shape a ele de modo que eu consiga depois realizar modelagem preditiva.
#' É importante que você incorpore essa regra no seu processo de análise tanto quanto possível.
#' 
#' 
#' 
# Sair
q()

