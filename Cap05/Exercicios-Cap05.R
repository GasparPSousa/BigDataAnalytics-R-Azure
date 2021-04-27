# Exercícios - Cap05

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap05")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = N, qmethod = "double")

# Resp:

write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")


# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
library(readr)
df_iris <- read_csv("iris.csv", col_types = matrix(
  Sepal.Length = col_double(1),
  Sepal.Width = col_double(1),
  Petal.Length = col_double(1),
  Petal.Width = col_double(1),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

# Resp: 

?read_csv
df_iris <- read_csv("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))


# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")

hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="height" , ylab="nbr of plants" , main="distribuition of height of 2 durum wheat varieties" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , add = T)
legend("topright", legend = c("Dataset 1", "Dataset 2"), col = c(rgb(1, 0, 0, 0.5),
                                                                 rgb(0, 0, 1, 0.5)), pt.cex = 2, pch = 15)

# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("plotly")

library(plotly)
head(iris)

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = ~Species , marker=list(size=20 , opacity=0.5))


# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico que resulta nesta imagem.
# googlando temos...https://www.r-graph-gallery.com/3d-surface-plot.html
head(volcano)

# 3D plot
p = plot_ly(z = volcano, type = "surface")
p



# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson
install.packages("rjson")
library("rjson")
result <- fromJSON(file = "~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/input.json")
print(result)
class(result)

## Aqui pegamos um arquivo JSON
## Importamos para a linguagem R
## Transformando um arquivo JSON em uma lista

# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.

df_json <- as.data.frame(result)
df_json
print(df_json)
class(df_json)

## Aqui transformo a lista em um Dataframe, pois é mais simples trabalhar.



# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML
install.packages("XML")
library("XML")
library("methods")

resultado <- xmlParse(file = "~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/input.xml")
print(resultado)
class(resultado)

# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe
df_xml <- xmlToDataFrame("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/input.xml")
print(df_xml)
class(df_xml)
View(df_xml)

## Basicamente esse vai ser sempre o trabalho...
## Pegar um arquivo em TXT, CSV, XLSX, JSON, XML, dados da Web e etc... trazer para o R e transformar em um Dataframe(tabela).
## E daí, poderemos fazer praticamente qualquer coisa, como fatiar a tabela, modificar linhas,
## modificar colunas, fazer pesquisas, criar novas colunas, plotar gráficos.
## Trabalhar com tabelas é sempre o ideal na maioria das vezes.
## Sempre que possível, transformar seu dados em formato de tabela que isso vai ajudar e muito nosso trabalho.





# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às seguintes perguntas:

data <- read.csv("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/input.csv")
data
View(data)

# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?

dim(data)
# Resp: 8 linhas e 5 colunas

# Pergunta 2 - Qual o maior salário?

maiorSalario <- max(data$salary)
maiorSalario
# Resp: 843.25

# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.

pessoaComMaiorSalario <- subset(data, salary == max(salary))
pessoaComMaiorSalario
# Resp:   id name salary start_date    dept
#       5  5 Gary 843.25 2015-03-27 Finance


# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.

pessoasDepartamentoTI <- subset(data, dept == "IT")
pessoasDepartamentoTI

# Resp: 
# id     name salary start_date dept
# 1  1     Rick  623.3 2012-01-01   IT
# 3  3 Michelle  611.0 2014-11-15   IT
# 6  6     Nina  578.0 2013-05-21   IT
  

# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600. 

fromTISalarioMaiorQue600 <- subset(data, dept == "IT" & salary > 600)
fromTISalarioMaiorQue600

# Resp:
# id     name salary start_date dept
# 1  1     Rick  623.3 2012-01-01   IT
# 3  3 Michelle  611.0 2014-11-15   IT


# Sair
q()
