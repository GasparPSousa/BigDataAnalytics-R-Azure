# Prevendo a Ocorrência de Câncer

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap11/Classificacao")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Definição do Problema de Negócio: Previsão de Ocorrência de Câncer de Mama
# http://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Diagnostic%29


## Etapa 1 - Coletando os Dados

# Os dados do câncer da mama incluem 569 observações de biópsias de câncer, 
# cada um com 32 características (variáveis). Uma característica é um número de 
# identificação (ID), outro é o diagnóstico de câncer, e 30 são medidas laboratoriais 
# numéricas. O diagnóstico é codificado como "M" para indicar maligno ou "B" para 
# indicar benigno.

dados <- read.csv("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap11/Classificacao/dataset.csv", stringsAsFactors = F)
str(dados)
View(dados)


## Etapa 2 - Pré-Processamento

# Excluindo a coluna ID
# Independentemente do método de aprendizagem de máquina, deve sempre ser excluídas 
# variáveis de ID. Caso contrário, isso pode levar a resultados errados porque o ID 
# pode ser usado para unicamente "prever" cada exemplo. Por conseguinte, um modelo 
# que inclui um identificador pode sofrer de superajuste (overfitting), 
# e será muito difícil usá-lo para generalizar outros dados.

dados$id = NULL

# Ajustando o label da variável alvo
dados$diagnosis = sapply(dados$diagnosis, function(x){ifelse(x == 'M', 'Maligno', 'Benigno')})

# Muitos classificadores requerem que as variáveis sejam do tipo Fator
table(dados$diagnosis)
dados$diagnosis <- factor(dados$diagnosis, levels = c('Benigno', 'Maligno'), labels = c('Benigno','Maligno'))
str(dados)
str(dados$diagnosis)


# Verificando a proporção
round(prop.table(table(dados$diagnosis)) * 100, digits = 1) 


# Medidas de Tendência Central
# Detectamos um problema de escala entre os dados, que então precisam ser normalizados
# O cálculo de distância feito pelo kNN é dependente das medidas de escala nos dados de entrada.

summary(dados[c("radius_mean", "area_mean", "smoothness_mean")])


# Criando um função de normalização
normalizar <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}


# Testando a função de normalização - os resultados devem ser idênticos
normalizar(c(1, 2, 3, 4, 5))
normalizar(c(10, 20, 30, 40, 50))

# Normalizando os dados

dados_norm <- as.data.frame(lapply(dados[2:31], normalizar))
View(dados_norm)
