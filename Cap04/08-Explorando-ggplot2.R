# ggplot2

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap04")

# Para saber qual diretório estou trabalhando
getwd()

# Lista de pacotes base carregados
search()


# Um sistema gráfico completo, alternativo ao sistema básico de gráficos do R.
# Oferece mais opções de modificação, legendas prontas e formatação mais sólida.

# https://cran.r-project.org/web/packages/ggplot2/ggplot2.pdf
# https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

# Instalando e carregando o pacote

install.packages("ggplot2")
library(ggplot2)


# Plotando um gráfico básico com qplot()
data(tips, package = 'reshape2')
View(tips)
qplot(total_bill, tip, data = tips, geom = 'point')


# Camada 1

camada1 <- geom_point(
  mapping = aes(x = total_bill, y = tip, color = sex),
  data = tips,
  size = 3
)

ggplot() + camada1

?aes
??aes
?mapping
??mapping


# Contruindo um modelo de regressão

modelo_base <- lm(tip ~ total_bill, data = tips)
modelo_fit <- data.frame(
  total_bill = tips$total_bill,
  predict(modelo_base, interval = "confidence")
)

head(modelo_fit)


# Camada 2

camada2 <- geom_line(
  mapping = aes(x = total_bill, y = fit),
  data = modelo_fit,
  color = "darkred"
)

ggplot() + camada1 + camada2


# Camada 3

camada3 <- geom_ribbon(
  mapping = aes(x = total_bill, ymin = lwr, ymax = upr),
  data = modelo_fit,
  alpha = 0.3
)

ggplot() + camada1 + camada2 + camada3


# Versão final otimizada

ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = 'lm')


# Gravando o gráfico em um objeto

myplot <- ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = 'lm')

class(myplot)
print(myplot)


# Salvando o gráfico em png

png("Grafico8_ggplot2_Scatterplot1.png", width = 800, height = 500, res = 72)

ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = 'lm')

dev.off()




# ScatterPlot com linha de regressão

# Dados


data = data.frame(cond = rep(c('Obs1', 'Obs2'),
                             each = 10), var1 = 1:100 +
                    rnorm(100, sd = 9), var2 = 1:100 +
                    rnorm(100, sd = 16))


# Plot
ggplot(data, aes(x = var1, y = var2)) +
  geom_point(shape = 1) +
  geom_smooth(method = lm, color = 'red', se = FALSE)

# Salvando o gráfico em png

png("Grafico8_ggplot2_Scatterplot2.png", width = 800, height = 500, res = 72)

ggplot(data, aes(x = var1, y = var2)) +
  geom_point(shape = 1) +
  geom_smooth(method = lm, color = 'red', se = FALSE)

dev.off()


# Bar Plot

data = data.frame(grupo = c("A ", "B ", "C ", "D ") ,
                  valor = c(33, 62, 56, 67), 
                  num_obs = c(100, 500, 459, 342))

# Gerando a massa de dados

data$right = cumsum(data$num_obs) + 30 * c(0:c(nrow(data)-1))
data$left = data$right - data$num_obs

# Plot

ggplot(data, aes(ymin = 0)) +
  geom_rect(aes(xmin = left, xmax = right, ymax =valor, color = grupo, fill = grupo)) +
  xlab('Número de Observações') + ylab('Valor') 
               
  

# Salvando o gráfico em png

png("Grafico8_ggplot2_Barplot1.png", width = 800, height = 500, res = 72)

ggplot(data, aes(ymin = 0)) +
  geom_rect(aes(xmin = left, xmax = right, ymax =valor, color = grupo, fill = grupo)) +
  xlab('Número de Observações') + ylab('Valor')

dev.off()



                