# Machine Learning - Regressão 
# Prevendo Despesas Hospitalares

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap11/Regressao")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Problema de Negócio: Previsão de Despesas Hospitalares

# Para esta análise, vamos usar um conjunto de dados simulando despesas médicas hipotéticas 
# para um conjunto de pacientes espalhados por 4 regiões do Brasil.
# Esse dataset possui 1.338 observações e 7 variáveis.

# Etapa 1 - Coletando os dados
despesas <- read.csv("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap11/Regressao/despesas.csv")
View(despesas)


# Etapa 2: Explorando e Preparando os Dados
# Visualizando as variáveis
str(despesas)



# Medias de Tendência Central da variável gastos
summary(despesas$gastos)

# Construindo um histograma
hist(despesas$gastos)
hist(despesas$gastos, main = 'Histograma', xlab = 'Gastos (R$)')

# Tabela de contingência das regiões
table(despesas$regiao)


# Explorando relacionamento entre as variáveis: Matriz de Correlação
cor(despesas[c('idade', 'bmi', 'filhos', 'gastos')])


# Nenhuma das correlações na matriz é considerada forte, mas existem algumas associações interessantes. 
# Por exemplo, a idade e o bmi (IMC) parecem ter uma correlação positiva fraca, o que significa que 
# com o aumento da idade, a massa corporal tende a aumentar. Há também uma correlação positiva 
# moderada entre a idade e os gastos, além do número de filhos e os gastos. Estas associações implicam 
# que, à media que idade, massa corporal e número de filhos aumenta, o custo esperado do seguro saúde sobe. 

# Visualizando relacionamento entre as variáveis: Scatterplot
# Perceba que não existe um claro relacionamento entre as variáveis
pairs(despesas[c('idade', 'bmi', 'filhos', 'gastos')])


# Scatterplot Matrix
install.packages("psych")
library(psych)



# Este gráfico fornece mais informações sobre o relacionamento entre as variáveis
pairs.panels(despesas[c('idade', 'bmi', 'filhos', 'gastos')])

# Etapa 3: Treinando o Modelo (usando os dados de treino)
?lm
modelo <- lm(gastos ~ idade + filhos + bmi + sexo + fumante + regiao, data = despesas)

# Similar ao item anterior
modelo <- lm(gastos ~ ., data = despesas)

# Visualizando os coeficientes
modelo

# Prevendo despesas médicas 
?predict


# Aqui verificamos os gastos previstos pelo modelo que devem ser iguais aos dados de treino
previsao1 <- predict(modelo)
View(previsao1)

# Prevendo os gastos com Dados de teste
despesasteste <- read.csv("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap11/Regressao/despesas-teste.csv")
View(despesasteste)
previsao2 <- predict(modelo, despesasteste)
View(previsao2)
