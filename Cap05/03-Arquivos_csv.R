# Trabalhando com Arquivos CSV

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap05")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()

# Usando o pacote readr 
install.packages("readr")
library(readr)

## Essas funções do Pacote readr, podemos usar tanto para arquivos .csv, quanto para arquivos .txt 


# Abre o promt para escolher o arquivo
meu_arquivo <- read.csv(file.choose())
meu_arquivo


# Importando arquivos
df1 <- read_table("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/temperaturas.txt", 
                  col_names = c("DAY", "MONTH", "YEAR", "TEMP"))

head(df1)
View(df1)
str(df1)

read_lines("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/temperaturas.txt", skip = 0, n_max = -1L)
read_file("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/temperaturas.txt")


# Exportando e Importando
write_csv(iris, "iris.csv")
dir()
View(iris)


## Tipos usados para carregar cada um das colunas.
# col_integer(): 
# col_double(): 
# col_logical(): 
# col_character(): 
# col_factor(): 
# col_skip(): 
# col_date() (alias = “D”), col_datetime() (alias = “T”), col_time() (“t”) 


df_iris <- read_csv("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

dim(df_iris)
str(df_iris)


# Manipulando arquivos csv
df_cadastro <- read_csv("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/cadastro.csv")
View(df_cadastro)
class(df_cadastro)


install.packages("dplyr")
library(dplyr)
options(warm = -1) # Serve para vc não visualizar as mensagens de Warning.

# O pacote readr serve para IMPORTAR os dados
# o pacote dplyr serve para MANIPULAR os dados

df_cadastro <- tbl_df(df_cadastro)
head(df_cadastro)
View(df_cadastro)


write.csv(df_cad, "df_cad_bkp.csv")

# Importando vários arquivos simultaneamente

list.files()
lista_arquivos <- list.files("~/Cursos/DSA/FCD/BigDataRAzure/Cap05/arquivos", full.names = T)
class(lista_arquivos)
lista_arquivos

lista_arquivos2 <- lapply(lista_arquivos, read_csv)
class(lista_arquivos2)
View(lista_arquivos2)


# Parsing
parse_date("01/02/15", "%m/%d/%y")
parse_date("01/02/15", "%d/%m/%y")
parse_date("01/02/34", "%y/%m/%d")


locale("en")
locale("fr")
locale("pt")

# Sair
q()
