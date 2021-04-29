# Carregando e Analisando Dados do MySQL com Linguagem R

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap06")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


install.packages('RMySQL', dependencies=TRUE)
install.packages("ggplot2")
install.packages("dbplyr")
library(RMySQL)
library(ggplot2)
library(dbplyr)
library(dplyr)

# Antes de trabalha com MySQL e R, acesse o shell do MySQL (no prompt ou terminal) e digite:
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'dsa1234';

# Conexão com o banco de dados
?dbConnect

con = dbConnect(MySQL(), user = "gaspar", password = "sousa2", dbname = "titanicDB", host = "localhost")


# Query SQL (para retornar um SUBSET de dados)
qry <- "SELECT pclass, survived, avg(age) AS media_idade FROM titanic WHERE survived = 1 GROUP BY pclass, survived;"
dbGetQuery(con, qry)

# Plot
dados <- dbGetQuery(con, qry)
head(dados)
class(dados)
ggplot(dados, aes(pclass, media_idade)) + geom_bar(stat = "identity")

# Conectando no MYSQL com dplyr
?src_mysql
con2 <- src_mysql(dbname = "titanicDB", user = 'gaspar', password = "sousa2", host = "localhost")


# Coletando e agrupando os dados
dados2 <- con2 %>%
  tbl("titanic") %>%
  select(pclass, sex, age, survived, fare) %>%
  filter(survived == 0) %>%
  collect()

head(dados2)


# Manipulando dados
dados2 <- con2 %>%
  tbl("titanic") %>%
  select(pclass, sex, survived) %>%
  group_by(pclass, sex) %>%
  summarise(survival_ratio = avg(survived)) %>%
  collect()

View(dados2)


# Plot
ggplot(dados2, aes(pclass, survival_ratio, color = sex, group = sex)) +
  geom_point(size = 3) +
  geom_line()


# Sumarizando os dados

dados2 <- con2 %>%
  tbl("titanic") %>%
  filter(fare > 150) %>%
  select(pclass, sex, age, fare) %>%
  group_by(pclass, sex) %>%
  summarise(avg_age = avg(age),avg_fare = avg(fare))

head(dados2)


# >>>> Para outros Bancos de Dados, use RODBC.

# Sair
q()



