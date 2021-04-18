# Funções Especiais

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap03")

# Para saber qual diretório estou trabalhando
getwd()



# unlist()
# Produz um vetor com os elementos da lista
?unlist

lista1 <- list(6, "b", 15)
lista1
class(lista1)


unlist(lista1)
vetor1 <- unlist(lista1)
class(vetor1)
vetor1


lista2 <- list(v1 = 6, v2 = list(381, 2190), v3 = c(30, 217))
lista2

unlist(lista2)

mean(unlist(lista2))
round(mean(unlist(lista2)))


# do.call()
# Executa uma função em um objeto
# *** ATENÇÃO ***
# As funções da FAMÍLIA APPLY aplicam uma função A CADA ELEMENTO de um objeto (substitui um loop)
# A função DO.CALL aplica uma função AO OBJETO INTEIRO e não a cada elemento individualmente
?do.call

data <- list()
N <- 100

for(n in 1:N) {
  data[[n]] = data.frame(index = n, char = sample(letters, 1), z = rnorm(1))
}

head(data)

do.call(rbind, data)
class(do.call(rbind, data))



# lapply() x do.call()
y <- list(1:3, 4:6, 7:9)
y

lapply(y, sum)
do.call(sum, y)  # Atenção na mudança da sintaxe, 



# O resultado da função lapply() pode ser obtido de outras formas
# Pacote plyr

install.packages('plyr')
library(plyr)

y <- list(1:3, 4:6, 7:9)
y

ldply(y, sum)

# strsplit()
# Divide uma string ou vetor de caracteres

texto <- "Data Science Academy"
strsplit(texto, " ") # Separação por Espaço

texto <- "Data Science Academy"
strsplit(texto, "") # Separação por TODOS os caracteres


texto <- "Data Science Academy"
strsplit(texto, "a")


dates <- c("1998-05-23", "2008-12-30", "2009-11-29")
temp <- strsplit(dates, "-")
temp
class(temp)




# Transforma a lista em matriz, fazendo antes um unlist()
matrix(unlist(temp), ncol = 3, byrow = TRUE)

Names <- c("Brin, Sergey", "Page, Larry",
           "Dorsey, Jack", "Glass, Noah",
           "Williams, Evan", "Stone, Biz")

Cofounded <- rep(c("Google", "Twitter"), c(2, 4))
temp <- strsplit(Names, ", ")
temp


frase <- "Muitas vezes temos que repetir algo diversas vezes e essas diversas vezes parece algo estranho"
palavras <- strsplit(frase, " ")[[1]]
palavras
unique(tolower(palavras))

?strsplit

# strplit() com dataframes
antes = data.frame(attr = c(1, 30, 4, 6), tipo = c('pao_e_agua', 'pao_e_agua2'))
antes
strsplit(as.character(antes$tipo), '_e_')

library(stringr)
str_split_fixed(antes$tipo, "_e_", 2)



# Usando do.call()
antes = data.frame(attr = c(1, 30, 4, 6), tipo = c('pao_e_agua', 'pao_e_agua_2'))
antes

depois <- strsplit(as.character(antes$tipo), '_e_')
depois
do.call(rbind, depois)



# Usando dplyr e tidyr
install.packages('dplyr')
install.packages('tidyr')
library(dplyr)
library(tidyr)

antes = data.frame(attr = c(1, 30, 4, 6), tipo = c('pao_e_agua', 'pao_e_agua_2'))
antes

antes %>% separate(tipo, c("pão", "agua"), "_e_")

# %>% é um caracter de concatenação dos pacotes dplyr e tidyr


# Sair
q()




