# Lista de Exercícios - Capítulo 2



# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap02")

# Para saber qual o diretório estou trabalhando:
getwd()

# Exercício 1 - Crie um vetor com 30 números inteiros

vetor = c(1:30)
vetor


# Exercício 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com números inteiros

matriz = matrix(c(31:46), nrow = 4, byrow = TRUE)
matriz

# Exercício 3 - Crie uma lista unindo o vetor e matriz criados anteriormente

lista = list(vetor, matriz)
lista


# Exercício 4 - Usando a função read.table() leia o arquivo do link abaixo para uma dataframe
# http://data.princeton.edu/wws509/datasets/effort.dat

df_teste <- data.frame(read.table(file = 'http://data.princeton.edu/wws509/datasets/effort.dat', header = TRUE, sep = ","))
df_teste
View(df_teste)


df_teste1 <- data.frame(read.table(file = 'http://data.princeton.edu/wws509/datasets/effort.dat'))
df_teste1
View(df_teste1)

class(df_teste1)
dim(df_teste1)

# Exercício 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes labels:
# c("config", "esfc", "chang")

names(df_teste1) <- c("config", "esfc", "chang")
colnames(df_teste1) <- c("config", "esfc", "chang")

df_teste1

# Exercício 6 - Imprima na tela o dataframe iris, verifique quantas dimensões existem no dataframe iris e imprima um resumo do dataset
iris
class(iris)
dim(iris)
View(iris)
summary(iris)
str(iris)

# Exercício 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris

plot(iris$Sepal.Length, iris$Sepal.Width)

# Exercício 8 - Usando a função subset, crie um novo dataframe com o conjunto de dados do dataframe iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a função subset()

iris[iris$Sepal.Length > 7,]

help(subset)

new_df = subset(iris, iris$Sepal.Length > 7)
new_df

# Exercícios 9 (Desafio) - Crie um dataframe que seja cópia do dataframe iris e usando a função slice(), divida o dataframe em um subset de 15 linhas
# Dica 1: Você vai ter que instalar e carregar o pacote dplyr
# Dica 2: Consulte o help para aprender como usar a função slice()

df_iris = iris
df_iris

install.packages("dplyr")
library(dplyr)

?sclice
slice(df_iris, 1:15)
slice(df_iris, 16:30)
slice(df_iris, 31:45)
slice(df_iris, 46:60)


class(slice(df_iris, 1:15))







# Exercícios 10 - Use a função filter no seu novo dataframe criado no item anterior e retorne apenas valores em que Sepal.Length > 6
# Dica: Use o RSiteSearch para aprender como usar a função filter

RSiteSearch('filter')

filter(df_iris, Sepal.Length > 6 )

filter(iris, Sepal.Length > 7 )

iris

# Sair
q()


