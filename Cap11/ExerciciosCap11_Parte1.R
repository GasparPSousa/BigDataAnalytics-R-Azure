#Exercícios Cap11 - Parte1

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap11")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


## Exercício 1 - Massa de dados aleatória

# Criando a massa de dados (apesar de aleatória, y possui 
# uma relação com os dados de x)

x <- seq(0, 100)
y <- 2 * x + 35

# Imprimindo as variáveis
x
y

# Gerando uma distribuição normal
y1 <- y + rnorm(101, 0, 50)
y1
hist(y1)


# Crie um plot do relacionamento de x e y1
plot(x, y1, pch = 19, xlab = 'X', ylab = 'Y')

# Crie um modelo de regressão para as duas variáveis x e y1
modelo <- lm(y1 ~ x)
modelo
class(modelo)

# Capture os coeficentes
a <- modelo$coefficients[1]
b <- modelo$coefficients[2]

a
b

# Fórmula de Regressão
y2 <- a + b*x

# Visualize a linha de regressão
lines(x, y2, lwd = 2)

# Simulando outras possíveis linhas de regressão
y3 <- (y2[51]-50*(b-1))+(b-1)*x
y4 <- (y2[51]-50*(b+1))+(b+1)*x
y5 <- (y2[51]-50*(b+2))+(b+2)*x
lines(x,y3,lty=3)
lines(x,y4,lty=3)
lines(x,y5,lty=3)
