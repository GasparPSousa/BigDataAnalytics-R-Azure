# Exercícios Cap11 - Parte2

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap11")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()

# Regressão Linear
# Definição do Problema: Prever as notas dos alunos com base em diversas métricas
# https://archive.ics.uci.edu/ml/datasets/Student+Performance
# Dataset com dados de estudantes
# Vamos prever a nota final (grade) dos alunos

# Carregando o dataset
df <- read.csv2('~/Cursos/DSA/FCD/Scripts/Arquivos-Cap11/estudantes.csv')

# Explorando os dados
head(df)
summary(df)
str(df)
any(is.na(df))

install.packages("ggplot2")
install.packages("ggthemes")
install.packages("dplyr")
library(ggplot2)
library(ggthemes)
library(dplyr)

# Obtendo apenas as colunas numéricas
colunas_numericas <- sapply(df, is.numeric)
colunas_numericas

# Filtrando as colunas numéricas para correlação
data_cor <- cor(df[,colunas_numericas])
data_cor
head(data_cor)


# Pacotes para visualizar a análise de correlação
install.packages('corrgram')
install.packages('corrplot')
library(corrplot)
library(corrgram)

# Criando um corrplot
corrplot(data_cor, method = 'color')

# Criando um corrgram
corrgram(df)
corrgram(df, order = T, lower.panel = panel.shade,
         upper.panel = panel.pie, text.panel = panel.txt)

# Criando um histograma
ggplot(df, aes(x = G3)) + 
  geom_histogram(bins = 20, alpha = 0.5, fill = 'blue') + 
  theme_minimal()

# Treinando e Interpretando o Modelo
# Import Library
install.packages("caTools")
library(caTools)


# Criando as amostras de forma randômica
set.seed(101)
?sample.split
amostra <- sample.split(df$age, SplitRatio = 0.70)


# ***** Treinamos nosso modelo nos dados de treino *****
# *****   Fazemos as predições nos dados de teste  *****

# Criando dados de treino - 70% dos dados
treino = subset(df, amostra == T)


# Criando dados de teste - 30% dos dados
teste = subset(df, amostra == F)

# Gerando o Modelo (Usando todos os atributos)
modelo_v1 <- lm(G3 ~ ., treino)
modelo_v2 <- lm(G3 ~ G1 + G2, treino)
modelo_v3 <- lm(G3 ~ absences, treino)
modelo_v4 <- lm(G3 ~ Medu, treino)

# Interpretando o Modelo
summary(modelo_v1)
# 0.8616
summary(modelo_v2)
# 0.8211
summary(modelo_v3)
# 0.0002675
summary(modelo_v4)
# 0.06442