# Data.table
# Mais rápido e performático que o data.frame.

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap07")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Instalando os pacotes
install.packages("data.table")
library(data.table)


# Criando 2 vetores
vec1 <- c(1, 2, 3, 4)
vec2 <- c('Vermelho', 'Verde', 'Marrom', 'Laranja')


# Criando um data.table
?data.table
dt1 <- data.table(vec1, vec2)
dt1
class(dt1)


# Slicing do data.table
dt2 <- data.table(A = 1:9, B = c("Z", "W", "Q"), C = rnorm(9), D = TRUE)
dt2
dt2[3:5,]
dt2[,.(B, C)]

dt2[, .(B, C, D)]

dt2[4:8, .(B, C)]

# o ponto de  .(B,C) faz parte da sintaxe da função.


# Aplicando função ao data.table
dt2[, .(Total = sum(A), Mean = mean(C))]
dt2[, plot(A, C)]

dt2[, .(MySum = sum(A)), by = .(Grp = A%%2)]

dt2


# Definindo valores por grupos
dt3 <- data.table(B = c("a", "b", "c", "d", "e", "a", "b", "c", "d", "e"),
                  val = as.integer(c(6:10, 1:5)))

dt3

# Operações com data.tables
dt4 <- data.table(A = rep(letters[2:1], each = 4L),
                  B = rep(1:4, each = 2L),
                  C = sample(8))
dt4
new_dt4 <- dt4[, sum(C), by = A]
# Quero todas as linhas, fazendo a soma da coluna C e agrupando pela coluna A.
new_dt4
class(new_dt4)

new_dt4[order(A)]

new_dt4 <- dt4[, sum(B), by = A][order(A)]
new_dt4

# Iris
dt5 <- data.table(iris)
dt5

dt5[, .(Sepal.Length = median(Sepal.Length),
        Sepal.Width = median(Sepal.Width),
        Petal.Length = median(Petal.Length),
        Petal.Width = median(Petal.Width)),
    by = Species]


# O parâmetro .SD significa Subset Data e um subset é criado considerando a coluna Species e depois 
# é calculda a mediana. O resultado deve ser igual ao comando anterior. 
# O .SD faz parte da notação do pacote data.table.
dt5[, lapply(.SD, median), by = Species]

# vamos fazer um Loop que vai aplicar a função mediana para o subset data agrupado por Species.


# Sair
q()
