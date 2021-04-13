# Tipos de Dados Avançados em R.


# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaços no nome

setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap02")

# Para saber qual o diretório estou trabalhando:
getwd()


# VETOR: É uma lista de elementos.
## Possui APENAS 1 dimensão e APENAS 1 tipo de dado.

vetor1 <- c(1:20)
vetor1

length(vetor1)
mode(vetor1)
class(vetor1)
typeof(vetor1)


# MATRIZ: É um conjunto de linhas e colunas, representando uma "planilha Excel"
## Possui APENAS 2 dimensões e APENAS 1 tipo de dado 

matriz1 <- matrix(1:20, nrow = 2)
matriz1

length(matriz1)
mode(matriz1)
class(matriz1)
typeof(matriz1)






# ARRAY: É um conjunto de linhas e colunas
## Possui 2 OU MAIS dimensões e APENAS 1 tipo de dado 

array1 <- array(1:5, dim = c(3, 3, 3))
array1

length(array1)
mode(array1)
class(array1)
typeof(array1)




# DATA FRAMES: dados de diferentes tipos
# Maneira mais fácil de explicar data frames: é uma matriz com diferentes tipos de dados

View(iris)

length(iris)
mode(iris)
class(iris)
typeof(iris)


# LISTAS: coleção de diferentes objetos
# Diferentes tipos de dados são possíveis e comuns

lista1 <- list(a = matriz1, b = vetor1)
lista1

length(lista1)
mode(lista1)
class(lista1)
typeof(lista1)




# Funções também são vistas como objetos em R

func1 <- function(x) {
  var1 <- x * x
  return(var1)
}


func1(5)
class(func1)  


# Removendo objetos

objects()
rm(array1, func1)
objects()


# Sair
q()