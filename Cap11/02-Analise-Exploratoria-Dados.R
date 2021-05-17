# Análise Exploratória de Dados

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap11")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Carregando o pacote readr
library(readr)

# Carregando o dataset
carros <- read_csv("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap11/carros-usados.csv")

# Resumo dos dados
View(carros)
str(carros)


# Medidas de Tendência Central

summary(carros$ano)
summary(carros[c('preco', 'kilometragem')])
