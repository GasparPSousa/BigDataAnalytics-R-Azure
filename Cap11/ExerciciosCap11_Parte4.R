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


# Criando um vetor de TRUE/FALSE indicando previsoes corretas/incorretas
agreement <- letter_predictions == letters_teste$letter
table(agreement)
prop.table(table(agreement))

# Otimizando o modelo
set.seed(12345)

# Recriando o modelo com outro tipo de kernel
letters_classifier_rbf <- ksvm(letter ~ ., data = letters_treino, kernel = "rbfdot")
letter_classifier_rbf <- ksvm(letter ~ ., data = letters_treino, kernel = "rbfdot")

# Novas Previsões
letter_predictions_rbf <- predict(letters_classifier_rbf, letters_teste)

# Compare os resultados com a primeira versao do modelo
agreement_rbf <- letter_predictions_rbf == letters_teste$letter
table(agreement_rbf)
prop.table(table(agreement_rbf))

## Com o kernel "rbfdot" aumentou a performance do modelo para 93%.
## Com o kernel "vanilladot" a performance do modelo estava em 84%.

# Sair
q()
