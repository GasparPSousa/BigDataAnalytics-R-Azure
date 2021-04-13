# Vetores, Operações com Vetores e Vetores Nomeados


# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaços no nome

setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap02")

# Para saber qual o diretório estou trabalhando:
getwd()


# Criando Vetores
# Use c() para criar Vetores

# Vetor de strings
vetor_caracter = c("Data", "Science", "Academy")
vetor_caracter



# Vetor de floats
vetor_numerico = c(1.90, 45.3, 300.5)
vetor_numerico


# Vetor de valores complexos
vetor_complexo = c(5.2+3i, 3.8+4i)
vetor_complexo

# Vetor de valores lógicos
vetor_logico = c(TRUE, FALSE, TRUE, FALSE, FALSE)
vetor_logico



# Vetor de números inteiros
vetor_integer = c(2, 4, 6)
vetor_integer



# Utilizando seq()
vetor1 = seq(1:10)
vetor1
is.vector(vetor1)




# Utilizando rep()
vetor2 = rep(1:5)
vetor2
is.vector(vetor2)

## Ou seja, existem 3 maneiras de criar um vetor.
## USando as funcões c(), seq() e rep()


# Indexação de vetores
a <- c(1, 2, 3, 4, 5)
a
a[0]
a[1]
a[5]
a[6]
# a[6] em R não gera erro, mas sim atribui NA...tem que tomar cuidado com isso.
# Ficar muito atento a isso, pois faz muita diferença no processo de análise.

vetor_caracter[1]
vetor_caracter[2]
vetor_caracter[3]

vetor_numerico[2]
vetor_complexo[1]
vetor_logico[3]


# Combinando vetores
v1 = c(2, 3, 5)
v2 = c("aa", "bb", "cc", "dd", "ee")
c(v1, v2)
c(v2, v1)
mode(c(v1, v2))
class(c(v1, v2))
typeof(c(v1, v2))
## vira tudo string


# Operações com Vetores
x = c(1, 3, 5, 7)
y = c(2, 4, 6, 8)

x * 5
x + y
x * y
x / y




# Somando vetores com números diferentes de elementos
alfa = c(10, 20, 30)
beta = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
alfa
beta
alfa + beta
## OBS: O objeto maior precisa ser MÚLTIPLO do objeto menor, do contrário dá erro!


# Vetor Nomeado
v = c("Nelson", "Mandela")
v
v[1]
v[2]

names(v) = c("Nome", "Sobrenome")
v
v["Nome"]
v["Sobrenome"]


# Sair
q()
