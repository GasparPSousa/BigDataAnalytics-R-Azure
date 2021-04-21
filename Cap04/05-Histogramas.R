# Histogramas

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap04")

# Para saber qual diretório estou trabalhando
getwd()

# Lista de pacotes base carregados
search()

# Definindo os dados

?cars
View(cars)
dados = cars$speed


# Construindo um histograma
?hist
hist(dados)

## Histograma mostra a distribuição de frequência


# Conforme consta no help, o parâmetro breaks pode ser um dos itens abaixo:
# Um vetor para os pontos de quebra entre as células do histograma
# Uma função para calcular o vetor de breakpoints
# Um único número que representa o número de células para o histograma
# Uma cadeia de caracteres que nomeia um algoritmo para calcular o número de células 
# Uma função para calcular o número de células.

hist(dados, breaks = 10, main = "Histograma de Velocidades")
hist(dados, labels = T, breaks = c(0, 5, 10, 20, 30), main = "Histograma de Velocidades")
hist(dados, labels = T, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, ylim = c(0,10), breaks = 10, main = "Histograma das Velocidades", col = 656 )

colors()



# Adicionando linhas ao histograma

grafico <- hist(dados, breaks = 10, main = "Histograma de Velocidades")

eixoX = seq(min(dados), max(dados), length = 10)
eixoY = dnorm(eixoX, mean = mean(dados), sd = sd(dados))
eixoY = eixoY*diff(grafico$mids)*length(dados)

lines(eixoX, eixoY, col = "red")
# Essa linha vermelha representa a Distribuição Normal(DN) dos dados.
# A distribuição normal mostra se os dados estão com Média = 0 e Desvio Padrão = 1

## Quando treinamos modelos de Machine Learnig, grande parte dos modelos esperam receber dados que estejam com uma Distribuição Normal.
## Se não tivermos os dados em uma DN, temos que transformar os dados em uma DN.


# Salvando o Histograma em png.

png("Grafico5_Histograma.png", width = 900, height = 900, res = 72)

grafico <- hist(dados, breaks = 10, main = "Histograma de Velocidades")

eixoX = seq(min(dados), max(dados), length = 10)
eixoY = dnorm(eixoX, mean = mean(dados), sd = sd(dados))
eixoY = eixoY*diff(grafico$mids)*length(dados)

lines(eixoX, eixoY, col = "red")

dev.off()

# Sair
q()
