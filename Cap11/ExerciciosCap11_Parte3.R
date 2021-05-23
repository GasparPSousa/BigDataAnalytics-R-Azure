# Exercícios Cap11 - Parte3

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap11")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Definindo o Problema: Analisando dados das casas de Boston, nos EUA e fazendo previsoes.

# The Boston Housing Dataset
# http://www.cs.toronto.edu/~delve/data/boston/bostonDetail.html

# Seu modelo deve prever a MEDV (Valor da Mediana de ocupação das casas). 
# Utilize um modelo de rede neural!

# Carregando o pacote MASS
library(MASS)

# Importando os dados do dataset Boston
set.seed(101)
dados <- Boston
View(dados)

# Resumo de dados
str(dados)
summary(dados)
any(is.na(dados))


# Carregando o pacote para Redes Neurais
install.packages("neuralnet")
library(neuralnet)

# Como primeiro passo, vamos abordar o pré-processamento de dados. 
# É uma boa pratica normalizar seus dados antes de treinar uma rede neural. 
# Dependendo do seu conjunto de dados, evitando a normalizacao pode levar a 
# resultados inúteis ou a um processo de treinamento muito dificil 
# (na maioria das vezes o algoritmo não ira convergir antes do numero de iteracoes
# maximo permitido). Voce pode escolher diferentes metodos para dimensionar os 
# dados (normalizacao-z, escala min-max, etc ...). 
# Normalmente escala nos intervalos [0,1] ou [1,1] tende a dar melhores resultados. 

# Normalizacao 
maxs <- apply(dados, 2, max)
mins <- apply(dados, 2, min)

# Imprimindo os valores
maxs
mins

# Normalizando
dados_normalizados <- as.data.frame(scale(dados, center = mins, scale = maxs - mins))
head(dados_normalizados)

# Criando os dados de treino e de teste
install.packages("caTools")
library(caTools)
split = sample.split(dados_normalizados$medv, SplitRatio = 0.70)

treino = subset(dados_normalizados, split == T)
teste = subset(dados_normalizados, split == F)

# Obtendo o nome das colunas
colunas_nomes <- names(treino)
colunas_nomes

# Agregando
formula <- as.formula(paste("medv ~", paste(colunas_nomes[!colunas_nomes %in% "medv"], collapse = " + ")))
formula


# Treinando o Modelo
rede_neural <- neuralnet(formula, data = treino, hidden = c(5,3), linear.output = T)

# Plot
plot(rede_neural)