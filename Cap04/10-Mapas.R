# Mapas

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap04")

# Para saber qual diretório estou trabalhando
getwd()

# Lista de pacotes base carregados
search()


# Instala os pacotes
install.packages("ggplot2")
install.packages("maps")
install.packages("mapdata")

# Carrega os pacotes
library(ggplot2)  # Para criar os gráficos de mapas
library(maps)     # Para obter os dados de mapas
library(mapdata)  # Para tratar esse dados


# Função para buscar as coordenadas dos países
?map_data
mapa <- map_data("world")

# Visualizando o dataframe

dim(mapa)
View(mapa)

# Gerando o Mapa

ggplot() + geom_polygon(data = mapa, aes(x = long, y = lat, group = group)) +
  coord_fixed(1.3)


ggplot() + geom_polygon(data = mapa, aes(x = long, y = lat, group = group), fill = NA, color = "black") +
  coord_fixed(1.3)

ggplot() + geom_polygon(data = mapa, aes(x = long, y = lat, group = group), fill = NA, color = "black") +
  coord_fixed(1.3)

gg1 <- ggplot() + geom_polygon(data = mapa, aes(x = long, y = lat, group = group), fill = "seagreen1", color = "black") +
  coord_fixed(1.3)
gg1



# Marcando alguns pontos no mapa
# Podemos usar um shapefile caso não tenhamos long e lat...No Brasil, o IBGE fornece esse tipo de arquivo.

labs <- data.frame(
  long = c(69.24140, -2.8456051),
  lat = c(-78.38995, 22.44512),
  names = c("Ponto1", "Ponto1=2"),
  stringsAsFactors = F
)

# Pontos no Mapa

gg1 + geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 2) +
  geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 2)


# Divisão por Países

ggplot(data = mapa) + 
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") +
  coord_fixed(1.3) +
  guides(fill = F)

# Para mais exemplo
# rMaps
# http://rmaps.github.io

# Sair
q()
