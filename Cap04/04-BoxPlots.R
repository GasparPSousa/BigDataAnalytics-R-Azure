# BoxPlots

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap04")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()

?boxplot
?sleep

# Permite utilizar as colunas sem especificar o nome do dataset
attach(sleep)
View(sleep)

# Construção do boxplot
sleepBoxPlot = boxplot(data = sleep, extra ~ group, main = "Duração do Sono (Boxplot Vertical)",
                       col.main = "red",
                       ylab = "Horas",
                       xlab = "Droga")

# extra ~ group - Estou pedindo ao R para mostrar a relação entre as variáveis
# extra e group do dataset sleep.
# ~ (til) em R, representa a relação entre duas variáveis.

# Cálculo da média
medias = by(extra, group, mean)

# Adiciona a média ao gráfico
points(medias, col = "red")

# Boxplot horizontal

boxPlotHorizontal = boxplot(data = sleep, extra ~ group, 
                            ylab = "",
                            xlab = "",
                            horizontal = T)

boxPlotHorizontal = boxplot(data = sleep, extra ~ group, 
                            main = "Duração do Sono (Boxplot Horizontal)",
                            ylab = "", xlab = "",
                            horizontal = T,
                            col = c("blue", "red"))


# Salvando o boxplot Vertical em png.
png("Grafico4_boxPlotVertical.png", width = 500, height = 500, res = 72)

sleepBoxPlot = boxplot(data = sleep, extra ~ group, main = "Duração do Sono (Boxplot Vertical)",
                       col.main = "red",
                       ylab = "Horas",
                       xlab = "Droga")

medias = by(extra, group, mean)

points(medias, col = "red")

dev.off()



# Salvando o boxplot Horizontal em png.
png("Grafico4_boxPlotHorizontal.png", width = 500, height = 500, res = 72)

boxPlotHorizontal = boxplot(data = sleep, extra ~ group, 
                            main = "Duração do Sono (Boxplot Horizontal)",
                            ylab = "", xlab = "",
                            horizontal = T,
                            col = c("blue", "red"))

medias = by(extra, group, mean)

points(medias, col = "black")

dev.off()

# Sair
q()


