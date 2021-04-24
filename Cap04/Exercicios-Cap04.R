# Exercícios - Cap04

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap04")

# Para saber qual diretório estou trabalhando
getwd()

# Lista de pacotes base carregados
search()

# Exercicio 1 - Crie uma função que receba os dois vetores abaixo como parâmetro, 
# converta-os em um dataframe e imprima no console
vec1 <- (10:13)
vec2 <- c("a", "b", "c", "d")

myfunc <- function(x, y) {
  df = data.frame(cbind(x, y))
  print(df)
}

myfunc(vec1, vec2)


df <- data.frame(vec1, vec2)
df

# Exercicio 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com 
# números inteiros e calcule a média de cada linha
mat = matrix(c(1:16),nrow = 4, ncol = 4, byrow = T)
mat1 = matrix(c(1:16),nrow = 4, ncol = 4, byrow = F)
mat
mat1

apply(mat, 1, mean)
apply(mat1, 1, mean)

?apply

# Exercicio 3 - Considere o dataframe abaixo. 
# Calcule a média por disciplina e depois calcule a média de apenas uma disciplina
escola <- data.frame(Aluno = c('Alan', 'Alice', 'Alana', 'Aline', 'Alex', 'Ajay'),
                     Matematica = c(90, 80, 85, 87, 56, 79),
                     Geografia = c(100, 78, 86, 90, 98, 67),
                     Quimica = c(76, 56, 89, 90, 100, 87))


escola

apply(escola[, c(2, 3, 4)], 2, mean)

apply(escola$Quimica, 2, mean)

# O comando acima gera erro.
# Isso acontece porque o interpretador do R tenta usar um vetor de qualquer dimensão,
# enquando apply espera que o objeto tenha algumas dimensões.
# Podemos evitar isso adicionando drop = F ao comando...

apply(escola[, c(2), drop = F], 2, mean)
apply(escola[, c(3), drop = F], 2, mean)
apply(escola[, c(4), drop = F], 2, mean)


# Exercicio 4 - Crie uma lista com 3 elementos, todos numéricos 
# e calcule a soma de todos os elementos da lista

lista <- list(1, 3, 5)
lista

do.call(sum, lista)

lista2 <- list(c(2:5), c(1:10), c(125:150))
lista2

do.call(sum, lista2)
# Exercicio 5 - Transforme a lista anterior um vetor
unlist(lista)

unlist(lista2)

# Exercicio 6 - Considere a string abaixo. Substitua a palavra "textos" por "frases"
str <- c("Expressoes", "regulares", "em linguagem R", 
         "permitem a busca de padroes", "e exploracao de textos",
         "podemos buscar padroes em digitos",
         "como por exemplo",
         "10992451280")

gsub("textos", "frases", str)

# Exercicio 7 - Usando o dataset mtcars, crie um gráfico com ggplot do tipo 
# scatter plot. Use as colunas disp e mpg nos eixos x e y respectivamente
View(mtcars)
library(ggplot2)
ggplot(mtcars, aes(x = disp, y = mpg)) + geom_point(shape = 1) 

ggplot(mtcars, aes(x = disp, y = mpg)) + geom_point(shape = 1) + geom_smooth(method = lm, color = 'red', se = F)





# Exercicio 8 - Considere a matriz abaixo.
# Crie um bar plot que represente os dados em barras individuais.
mat1 <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
mat1

barplot(mat1, beside = T)


# Exercício 9 - Qual o erro do código abaixo?
data(diamonds)
ggplot(data = diamonds, aes(x = price, group = fill, fill = cut)) + 
  geom_density(adjust = 1.5)

# No comando acima o interpretador não encontra o campo "fill", mas "fill" = cut
# cut é uma coluna do dataset
# Logo vale tentar colocar group = cut

ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) + 
  geom_density(adjust = 1.5)


View(diamonds)
# Exercício 10 - Qual o erro do código abaixo?
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_barplot() +
  labs(fill = "cyl")

# No ggplot2, para plotar o gráfico de barra, usa-se o geom_bar() e não o geom_barplot()

ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  labs(fill = "cyl")



# Sair
q()
