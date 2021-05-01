# Exercícios Cap06

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap06")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Exercicio 1 - Instale a carregue os pacotes necessários para trabalhar com SQLite e R
install.packages("RSQLite")
install.packages("dbplyr")
install.packages("dplyr")
library(RSQLite)
library(dbplyr)
library(dplyr)


# Exercicio 2 - Crie a conexão para o arquivo mamiferos.sqlite em anexo a este script
mamiferos <- dbConnect(SQLite(), "~/Cursos/DSA/FCD/Scripts/Arquivos-Cap06/mamiferos.sqlite")

# Exercicio 3 - Qual a versão do SQLite usada no banco de dados?
# Dica: Consulte o help da função src_dbi()
?src_dbi
src_dbi(mamiferos)

# Exercicio 4 - Execute a query abaixo no banco de dados e grave em um objero em R:
# SELECT year, species_id, plot_id FROM surveys

dados <- tbl(mamiferos, sql("SELECT year, species_id, plot_id FROM surveys"))


# Exercicio 5 - Qual o tipo de objeto criado no item anterior?
class(dados)

# Exercicio 6 - Já carregamos a tabela abaixo para você. Selecione as colunas species_id, sex e weight com a seguinte condição:
# Condição: weight < 5
pesquisas <- tbl(mamiferos, "surveys")

pesquisas %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)

# Exercicio 7 - Grave o resultado do item anterior em um objeto R. O objeto final deve ser um dataframe
dados2 <- pesquisas %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)

class(dados2)

dados3 <- as.data.frame(dados2)

class(dados3)
View(dados3)


# Exercicio 8 - Liste as tabelas do banco de dados carregado
dbListTables(mamiferos)



# Exercicio 9 - A partir do dataframe criado no item 7, crie uma tabela no banco de dados
dbWriteTable(mamiferos, "dados3", dados3)
dbRemoveTable(mamiferos, "dados3")
dbListTables(mamiferos)


# Exercicio 10 - Imprima os dados da tabela criada no item anterior

dbReadTable(mamiferos, "dados3")


# Sair
q()