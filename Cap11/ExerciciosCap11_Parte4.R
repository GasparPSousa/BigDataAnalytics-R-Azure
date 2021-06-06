# Exercícios Cap11 - Parte4

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap11")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Definindo o Problema: OCR - Optical Character Recognition
# Seu modelo deve prever o caracter a partir do dataset fornecido. Use um modelo SVM

## Explorando e preparando os dados
letters <- read.csv("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap11/letterdata.csv")
View(letters)
str(letters)



# Criando dados de treino e dados de teste
letters_treino <- letters[1:16000, ]
letters_teste <- letters[16001:20000, ]


# Treinamento do modelo
install.packages("kernlab")
library(kernlab)

# Criando o modelo com o kernel vanilladot
letters$letter <- as.factor(letters$letter)
str(letters)
letters_classifier <- ksvm(letter ~ ., data = letters_treino, kernel = "vanilladot")


# Visualizando o modelo
letters_classifier


# Avaliando a performance do modelo
letter_predictions <- predict(letters_classifier, letters_teste)
head(letter_predictions)
table(letter_predictions, letters_teste$letter)
