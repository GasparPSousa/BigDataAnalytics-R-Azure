# Gráficos de Pizza

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap04")

# Para saber qual diretório estou trabalhando
getwd()

# Lista de pacotes base carregados
search()

?pie

# Criando as fatias (Representando o PERCENTUAL)
fatias = c(40, 20, 40)

# Nomeando os labels
paises = c("Brasil", "Argentina", "Chile")

# Unindo paises e fatias
paises = paste(paises, fatias)

# Incluindo mais detalhes no label
paises = paste(paises, "%", sep = "")

colors()

# Construindo um gráfico
pie(fatias, labels = paises,
    col = c("darksalmon", "gainsboro", "lemonchiffon4"), 
    main ="Dsitribuição de Vendas")


# Trabalhando com dataframes
?iris
attach(iris)
Values = table(Species) 
labels = paste(names(Values))
pie(Values, labels = labels, main = "Distribuição de Espécies")


# 3D
install.packages("plotrix")
library(plotrix)

pie3D(fatias, labels = paises, explode = 0.05,
      col = c("steelblue1", "tomato2", "tan3"), 
      main = "Dsitribuição de Vendas")


# Salvando o Pie1 em png.
png("Grafico7_Pizza1.png", width = 500, height = 500, res = 72)

pie(fatias, labels = paises,
    col = c("darksalmon", "gainsboro", "lemonchiffon4"), 
    main ="Dsitribuição de Vendas")

dev.off()

# Salvando o BarPlot2 em png.

png("Grafico7_Pizza2.png", width = 800, height = 500, res = 72)

pie3D(fatias, labels = paises, explode = 0.05,
      col = c("steelblue1", "tomato2", "tan3"), 
      main = "Dsitribuição de Vendas")

dev.off()

# Sair
q()
