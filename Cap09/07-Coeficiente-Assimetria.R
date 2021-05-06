# Coeficiente de Assimetria (Skewness)

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap09")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


##### Coeficiente de Assimetria #####

# O coeficiente de assimetria é o que permite dizer se uma determinada distribuição é assimétrica ou não.

# Exemplo: Os seguintes dados representam o número de acidentes diários em um complexo industrial 
# (colocados em ordem crescente), durante o período de 50 dias. Represente o histograma desses dados.

dados = c(18, 20, 20, 21, 22, 24, 25, 25, 26, 27, 29, 29, 
          30, 30, 31, 31, 32, 33, 34, 35, 36, 36, 37, 37, 
          37, 37, 38, 38, 38, 40, 41, 43, 44, 44, 45, 45, 
          45, 46, 47, 48, 49, 50, 51, 53, 54, 54, 56, 58, 62, 65)


hist(dados, main = "Número de acidentes Diários", xlab = "Acidentes", ylab = "Frequência")

mean(dados)
sd(dados)
median(dados)

install.packages("moments")
library(moments)
SK = skewness(dados)
print(SK)



# Sk ≈ 0: dados simétricos. Tanto a cauda do lado direito quanto a do lado esquerdo da função densidade de probabilidade são iguais.
# Sk < 0: assimetria negativa. A cauda do lado esquerdo da função densidade de probabilidade é maior que a do lado direito.
# Sk > 0: assimetria positiva. A cauda do lado direito da função densidade de probabilidade é maior que a do lado esquerdo.

# O coeficiente de assimetria é 0.2549279. 

# Como o coeficiente de assimetria é maior que 0, diz-se que a curva apresenta assimetria positiva 
# e a cauda do lado direito da função densidade de probabilidade é maior que no lado esquerdo. 
# Ao observar também o Histograma, percebe-se que há maior densidade de dados do lado direito. 

#' "Se eu tiver agora que usar um modelo de Machine Learnig, eu precisaria primeiro fazer um tratamento nesses dados.
#' Colocando eles de forma que o histograma ficasse simétrico.
#' Por isso usamos tanto histograma em Ciência de Dados
#' Quando eu começo o processo eu crio o histograma e analiso como os dados estão distribuídos.
#' Eu calculo o coeficiente de assimetria, descubro que eu tenho assimetria(positiva ou negativa).
#' Logo aplico uma técnica(que veremos mais a frente) e então coloco meus dados de forma que o histograma seja simétrico.
#' Agora sim, pego meu dados e encaminho para modelagem preditiva.
#' Percebeu porque usamos a Estatística?
#' Todas as ferramentas que utilizamos nesse processo são oferecidos pela Estatística Descritiva.
#' Por isso ela é tão importante no processo de Ciência de Dados"
#' 
#' 
#' 
#'

# Outro exemplo
set.seed(1234)
x = rnorm(1000)
hist(x)
skewness(x)
#' Nesse caso, como o coeficiente de Assimetria é muito próximo de Zero(-0.005202026), ele temos dados simétricos.
#' 

# Sair
q()

