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

##### Análise Exploratória de Dados Para Variáveis Numéricas ##### 

# Usando as funções
mean(carros$preco)
median(carros$preco)
quantile(carros$preco)
quantile(carros$preco, probs = c(0.01, 0.99))
quantile(carros$preco, seq(from = 0, to = 1, by = 0.20))
IQR(carros$preco) # Diferença entre Q3 e Q1
range(carros$preco)
diff(range(carros$preco))


# Plot

# Boxplot
# Leitura de Baixo para Cima - Q1, Q2 (Mediana) e Q3

boxplot(carros$preco, main = "BoxPlot para os Preços Carros Usados", ylab  = "Preço (R$)")
boxplot(carros$kilometragem, main = "BoxPlot para a km de Carros Usados ", ylab = "kilometragem (R$)")


# Histograma
# Indicam a frequência de valores dentro de cada bin (classe de valores)

hist(carros$preco, main = "Histograma para os Preços Carros Usados", ylab = "Preço (R$)")
hist(carros$kilometragem, main = "Histograma para a km de Carros Usados", ylab = "kilometragem (R$)")
hist(carros$kilometragem, main = "Histograma para a km de Carros Usados", breaks = 5, ylab = "kilometragem (R$)")


# Scatterplot Preço x Km
# Usando o preço como variável dependente (y)

plot(x = carros$kilometragem, y = carros$preco,
     main = "Scatterplot - Preço x km",
     xlab = "kilometragem",
     ylab = "Preço (R$)")

# Medidas de Dispersão
# Ao interpretar a variância, números maiores indicam que 
# os dados estão espalhados mais amplamente em torno da 
# média. O desvio padrão indica, em média, a quantidade 
# de cada valor diferente da média.

var(carros$preco)
sd(carros$preco)
var(carros$kilometragem)
sd(carros$kilometragem)
