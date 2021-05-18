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
